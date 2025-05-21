#!/bin/sh

set -e

echo "initializing Vault server" \
    "" 1>&1

VAULT_ADDR="http://vault-0.vault-internal:8200"

INIT_RESPONSE=$(curl \
    --header "X-Vault-Token: ${VAULT_TOKEN}" \
    --request POST \
    --data @- \
    ${VAULT_ADDR}/v1/sys/init <<EOF
{
  "recovery_shares": 1,
  "recovery_threshold": 1
}
EOF
)

RECOVERY_KEY2=$(echo "$INIT_RESPONSE" | jq -r .recovery_keys_b64[0])
VAULT_TOKEN2=$(echo "$INIT_RESPONSE" | jq -r .root_token)

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
        "name": "vault-secret"
    },
    "type": "Opaque",
    "stringData": {
        "unseal_key": "$RECOVERY_KEY2",
        "root_token": "$VAULT_TOKEN2"
    }
}
EOF