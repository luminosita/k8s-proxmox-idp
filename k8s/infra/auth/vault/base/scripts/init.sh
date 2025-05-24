#!/bin/sh

set -e

echo "initializing Vault server" \
    "" 1>&1

VAULT_ADDR="http://vault-0.vault-internal:8200"

INIT_RESPONSE=$(curl -s \
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

RECOVERY_KEY2=$(echo "$INIT_RESPONSE" | jq -r .recovery_keys_base64[0])
VAULT_TOKEN2=$(echo "$INIT_RESPONSE" | jq -r .root_token)

if [ -z "$RECOVERY_KEY2" ] || [ -z "$VAULT_TOKEN2" ]; then
    echo "Unable to initialize Vault instance" \
        "" 1>&1

    exit 1
fi

# echo "enabling Kuberentes authentication method" \
#     "" 1>&1

# sleep 5

# resp=$(curl -s \
#     --header "X-Vault-Token: ${VAULT_TOKEN2}" \
#     --request POST \
#     --data @- \
#     ${VAULT_ADDR}/v1/sys/auth/kubernetes  <<EOF
# {
#     "type": "kubernetes"
# }
# EOF
# )

# if [ ! -z "$resp" ]; then
#     echo "Vault error response($resp)" \
#         "" 1>&1

#     exit 1
# fi

# echo "configuring Kubernetes authentication method" \
#     "" 1>&1

# sleep 1

# resp=$(curl -s \
#     --header "X-Vault-Token: ${VAULT_TOKEN2}" \
#     --request POST \
#     --data @- \
#     ${VAULT_ADDR}/v1/auth/kubernetes/config <<EOF
# {
#     "kubernetes_host": "https://${KUBERNETES_SERVICE_HOST}:${KUBERNETES_SERVICE_PORT_HTTPS}"
# }
# EOF
# )

# if [ ! -z "$resp" ]; then
#     echo "Vault error response($resp)" \
#         "" 1>&1

#     exit 1
# fi

echo "creating Kubernetes Secret (vault-secret)" \
    "" 1>&1

API_SERVER="https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_SERVICE_PORT_HTTPS"
SA_TOKEN=/var/run/secrets/kubernetes.io/serviceaccount/token

resp=$(curl -s -X POST \
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
        "recovery_key": "${RECOVERY_KEY2}",
        "root_token": "${VAULT_TOKEN2}",
        "credentials": "{\"token\": \"${VAULT_TOKEN2}\"}"
    }
}
EOF
)

echo "Vault server initialized successfully." \
    "" 1>&1

