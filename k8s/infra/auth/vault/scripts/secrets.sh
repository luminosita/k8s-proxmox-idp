#Done thru init job
# vault auth enable kubernetes

# vault write auth/kubernetes/config \
#       kubernetes_host="https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_SERVICE_PORT_HTTPS"

vault policy write internal-app - <<EOF
path "internal/data/*" {
   capabilities = ["read"]
}
EOF

vault write auth/kubernetes/role/internal-app \
    bound_service_account_names=default \
    bound_service_account_namespaces="minio,app" \
    policies=internal-app \
    audience=vault \
    ttl=24h

vault secrets enable -path=internal kv-v2
vault kv put internal/minio/creds username="laza" password="lazalaza"
vault kv put internal/test/creds username="static-user" password="static-password"

