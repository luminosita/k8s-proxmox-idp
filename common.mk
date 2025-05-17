TOKEN:=$(shell vault kv get --format=json secret/proxmox | jq '.data.data.api_token')

export TF_VAR_proxmox_api_token=${TOKEN}


