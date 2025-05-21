#!/bin/sh

set -e

echo "initializing transit Vault server and capturing the recovery key and root token" \
    "" 1>&1

#Waiting on vault-transit pod to start
sleep 15

VAULT_ADDR="http://vault-transit-0.vault-transit-internal:8200"

INIT_RESPONSE=$(curl \
    --request POST \
    --data @- \
    ${VAULT_ADDR}/v1/sys/init <<EOF
{
  "secret_shares": 1,
  "secret_threshold": 1
}
EOF
)

UNSEAL_KEY=$(echo "$INIT_RESPONSE" | jq -r .keys_base64[0])
VAULT_TOKEN=$(echo "$INIT_RESPONSE" | jq -r .root_token)

curl --header "X-Vault-Token: ${VAULT_TOKEN}" \
    --request POST \
    --data "{\"key\":\"${UNSEAL_KEY}\"}" \
    ${VAULT_ADDR}/v1/sys/unseal

curl --header "X-Vault-Token: ${VAULT_TOKEN}" \
    --request POST \
    --data "{\"type\":\"transit\"}" \
    ${VAULT_ADDR}/v1/sys/mounts/transit

curl --header "X-Vault-Token: ${VAULT_TOKEN}" \
    --request POST \
    $VAULT_ADDR/v1/transit/keys/unseal_key

API_SERVER="https://$KUBERNETES_PORT_443_TCP_ADDR:$KUBERNETES_SERVICE_PORT_HTTPS"
SA_TOKEN=/var/run/secrets/kubernetes.io/serviceaccount/token

curl -X POST \
    -H "Authorization: Bearer $(cat ${SA_TOKEN})" \
    -H "Content-Type: application/json" \
    --data @- \
    --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt \
    "$API_SERVER/api/v1/namespaces/${NAMESPACE}/secrets" <<EOF
{
    "apiVersion": "v1",
    "kind": "Secret",
    "metadata": {
        "name": "vault-transit-secret"
    },
    "type": "Opaque",
    "stringData": {
        "unseal_key": "$UNSEAL_KEY",
        "root_token": "$VAULT_TOKEN"
    }
}
EOF