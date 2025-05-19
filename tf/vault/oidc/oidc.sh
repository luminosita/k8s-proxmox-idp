vault auth enable userpass

vault policy write oidc-auth - << EOF
path "identity/oidc/provider/my-provider/authorize" {
capabilities = [ "read" ]
}
EOF

vault write auth/userpass/users/end-user \
    password="password" \
    token_policies="oidc-auth" \
    token_ttl="1h"

vault write identity/entity \
    name="end-user" \
    metadata="email=vault@hashicorp.com" \
    metadata="phone_number=123-456-7890" \
    disabled=false

ENTITY_ID=$(vault read -field=id identity/entity/name/end-user)

vault write identity/group \
    name="engineering" \
    member_entity_ids="$ENTITY_ID"

GROUP_ID=$(vault read -field=id identity/group/name/engineering)

USERPASS_ACCESSOR=$(vault auth list -detailed -format json | jq -r '.["userpass/"].accessor')

vault write identity/entity-alias \
    name="end-user" \
    canonical_id="$ENTITY_ID" \
    mount_accessor="$USERPASS_ACCESSOR"

vault write identity/oidc/assignment/my-assignment \
    entity_ids="${ENTITY_ID}" \
    group_ids="${GROUP_ID}"

vault write identity/oidc/key/my-key \
    allowed_client_ids="*" \
    verification_ttl="2h" \
    rotation_period="1h" \
    algorithm="RS256"

vault write identity/oidc/client/boundary \
    redirect_uris="http://127.0.0.1:9200/v1/auth-methods/oidc:authenticate:callback" \
    assignments="my-assignment" \
    key="my-key" \
    id_token_ttl="30m" \
    access_token_ttl="1h"

CLIENT_ID=$(vault read -field=client_id identity/oidc/client/boundary)

USER_SCOPE_TEMPLATE='{
    "username": {{identity.entity.name}},
    "contact": {
        "email": {{identity.entity.metadata.email}},
        "phone_number": {{identity.entity.metadata.phone_number}}
    }
}'

vault write identity/oidc/scope/user \
    description="The user scope provides claims using Vault identity entity metadata" \
    template="$(echo ${USER_SCOPE_TEMPLATE} | base64 -)"

GROUPS_SCOPE_TEMPLATE='{
    "groups": {{identity.entity.groups.names}}
}'

vault write identity/oidc/scope/groups \
    description="The groups scope provides the groups claim using Vault group membership" \
    template="$(echo ${GROUPS_SCOPE_TEMPLATE} | base64 -)"

vault write identity/oidc/provider/my-provider \
    allowed_client_ids="${CLIENT_ID}" \
    scopes_supported="groups,user"


curl -s $VAULT_ADDR/v1/identity/oidc/provider/my-provider/.well-known/openid-configuration | jq

curl -s $VAULT_ADDR/v1/identity/oidc/provider/my-provider/.well-known/keys | jq