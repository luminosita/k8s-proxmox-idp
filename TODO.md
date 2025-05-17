## 🏗️ Work in Progress

- [ ] Proxmox Network Topography
- [x] Cloudflare Terraform
- [ ] Taskfile
- [ ] ArgoCD vs Flex for dev,staging,production environment
- [ ] Canary Release
- [ ] Renovate (Terraform, Homebrew, Proxmox Apt, Talos, Kubernetes, Cilium, Routers, Argo, Flux) 


## Caddy

- [x] Caddy instead of Nginx (ACME Client for Vault)
- [x] Caddy Security module                        
- [x] Caddy ACME cert-mgr, TLS                     
- [x] Caddy OIDC Vault                             

## Crossplane
- [x] PKI server certificate
- [x] Replace to namespaced Claims
- [x] Pipeline with functions
- [x] SSH OTP 
- [x] SSH CA

## Monitoring
- [ ] Grafana Stack 
- [ ] Grafana Alerting

## Databases
- [ ] OpenLDAP Cluster
- [ ] Minio
- [ ] Backstage
    - [ ] LDAP
    - [ ] Kubernetes
    - [ ] Grafana
    - [ ] Git repo templates
- [ ] PSQL Atlas Operator

## API
- [ ] KrakenD                                                   
- [ ] gRPC plugin for KrakenD 

## UI
- [ ] React with OpenLDAP as backend or Backstage
- [ ] CRUD UI
- [ ] CRUD backend OpenLDAP

## Boundary                 
- [ ] Dev setup                 (plan #1)
- [ ] Kubernetes deployment     (plan #2)
- [ ] Vault authentication      (plan #3)
- [ ] Proxmox
- [ ] OPNSense
- [ ] Talos nodes (talosctl)
- [ ] Kubectl
- [ ] Mikrotik

### Misc

- [ ] Port trunking, one server in two VLANs??? 
- [ ] ACME SSL certificate for Proxmox cluster
- [ ] ACME SSL certificate for OPNSense




*********** For Review ****************

## Issues
- [ ] "scripts" folder
- [ ] local vars into proper vars
- [ ] Gateway API

    --set gatewayAPI.enabled=true \
    --set gatewayAPI.enableAlpn=true \
    --set gatewayAPI.enableAppProtocol=true \

# HA K8s
- [ ] Kube VIP front loadbalancer
- [ ] RBAC
- [ ] Mesh

# DCIM
- [ ] Thinkerbell
- [ ] NetBox

# Storage
- [ ] Ceph/Rook/Proxmox/CSI Plugin
- [ ] Type of storage (fast, slow, archive, backup, block, file, object)

# Misc
- [ ] https://github.com/orgs/home-operations/packages?repo_name=containers
- [ ] Only Proxy Server in DMZ 
- [ ] Email Gateway
- [ ] Firewall ACL based on username, security tags
- [ ] CEF fast forwarding Cisco
- [x] Proxmox UEFI boot
- [ ] Talos VM settings (OPNSense guide, homenetworkguy) 
- [ ] Netbox source of truth, versions instead of Flux/Terraform IAS controller
- [ ] Verify #FIXME
- [ ] iPerf3
- [ ] K8s on bare metal vs VMs (hyperconverged) 

