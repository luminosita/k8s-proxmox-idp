## 🏗️ Work in Progress
- [ ] Talos VM UEFI bootloader
- [ ] Talos VM settings (OPNSense guide, homenetworkguy) 
- [X] Proxmox Network Topography
- [X] Cloudflare Terraform
    - [ ] Issues with local domain fallback
- [X] Taskfile (DevOps Toolkit)
- [ ] Bash Terminal improvements (DevOps Toolkit)
- [ ] App Management (DevOps Toolkit)
- [ ] IDP Playlist (DevOps Toolkit)
- [ ] Nix Shell
- [X] DNS resolving from internel K8s network to outside (NFS mount with fixed IP)
- [ ] Renovate
- [ ] Remark42
- [ ] DNS records: internal (VPN, Cloudflare) and external
- [ ] Finish README
- [ ] KCL               
- [ ] Chainsaw          

## Renovate
- [X] Helm values files other than values.yaml (values-xxx.yaml)
- [X] Terraform
- [X] Talos (bootstrap/inline manifests)
- [X] Kubernetes
- [X] Cilium
- [ ] Argo 
- [ ] General search for "version:"

## AI
- [ ] Claude Code
- [ ] DeepSeek Coder

## Crossplane
- [X] PKI server certificate
- [X] Replace to namespaced Claims
- [X] Pipeline with functions
- [X] SSH OTP 
- [X] SSH CA
- [ ] Observe resources
- [ ] Composition Configuration Package
- [ ] KCL rewrite       

## Observability (DevOps Toolkit)
- [ ] Grafana Stack LGTM
- [ ] Grafana Alerting
- [ ] Pixie or Beyla
- [ ] DDosify
- [ ] Robusta
- [ ] Komodor
- [ ] Fiberplane post mortem 
- [ ] Inspektor Gadget
- [X] Aggregated Logs
    - [X] Proxmox
    - [X] K8s
    - [ ] Talos
- [X] Promtail
- [X] Loki (standard vs microservice mode)
- [ ] bitnami/kubernetes-event-exporter
- [ ] Log rotation
- [ ] Prometheus/Grafana (https://medium.com/@abdullah.eid.2604)
    - [X] Proxmox
    - [X] K8s
    - [ ] Databases
    - [ ] etcd
- [ ] Telemetry/Grafana Tempo (enable tracing for Loki)
    - [X] Telemetry Collector
    - [ ] Connect with logs
    - [ ] Tyk
    - [ ] Auto-injection (https://opentelemetry.io/docs/kubernetes/operator/automatic/, https://github.com/open-telemetry/opentelemetry-operator/)
- [ ] Alertmanager
- [ ] Audit
    - [ ] K8s Audit Logs (https://araji.medium.com/kubernetes-security-monitor-audit-logs-with-grafana-2ab0063906ce)
    - [ ] Tyk Audit Logs
- [ ] Sentry

## Vault
- [X] Transit
    - [X] Unseal to Secret (init container)
    - [X] Create Unseal Key transit mount
- [X] Vault Cluster
    - [X] Wait for the transit credentials secret to become available (argo presync hook ?)
    - [X] Auto unseal with transit Vault
- [X] Vault credentials injection
- [X] Vault Kubernetes config from init job script to crossplane
- [X] Vault static secrets operator
    - [X] Configuration
    - [X] Crossplane
- [ ] Vault dynamic secrets
    - [ ] Crossplane
    - [ ] Vault Secrets Operator client cache config (https://developer.hashicorp.com/vault/tutorials/kubernetes/vault-secrets-operator#transit-encryption)
- [ ] OpenLDAP
- [X] Solar
- [X] ArgoCD
- [X] Wikijs
- [ ] Mattermost
- [ ] NextCloud
- [ ] OpenProject
- [X] OpenId Connect
- [ ] Coder Full Environment (coder.com)
- [X] oauth2-proxy
- [ ] API Gateway
    - [ ] Redis
- [ ] OPA OIDC integration (https://www.openpolicyagent.org/docs/latest/oauth-oidc/)
- [ ] Key rotation
- [ ] Revoke token

## Databases
- [ ] Minio
    - [ ] StatefulSet with PVC Template
    - [ ] Crossplane Bucket creation
    - [X] Admin credentials
- [ ] PSQL (DevOps Toolkit)
    - [X] Superuser static credentials
    - [ ] Atlas Operator (DevOps Toolkit)
    - [ ] Crossplane DB creation
    - [ ] DB credentials (DevOps Toolkit - crossplane tutorial)
- [ ] OpenLDAP (https://www.ibm.com/docs/en/rpa/23.0.x?topic=ldap-installing-configuring-openldap)
    - [ ] slapd.d with Vault Template Inject (credentials)
- [ ] Redis
    - [ ] Credentials
- [ ] MySql (MariaDB)
- [ ] Supabase

## Boundary                 
- [ ] Dev setup                 
- [ ] Kubernetes deployment     
- [ ] Vault authentication OIDC     
- [ ] .bashrc function to sign certificate for a Boundary session
- [ ] Proxmox
- [ ] OPNSense
- [ ] Talos nodes (talosctl)
- [ ] Kubectl
- [ ] Mikrotik

## Authorization
- [ ] OPA
 
## Caddy
- [X] Caddy instead of Nginx (ACME Client for Vault)
- [X] Caddy Security module                        
- [X] Caddy ACME cert-mgr, TLS                     
- [X] Caddy OIDC Vault                             

## API Gateway
- [ ] KrakenD                                                   
- [ ] gRPC plugin for KrakenD 
- [ ] API Audit
- [ ] Custom Operator
- [ ] Goplugins
- [ ] Authentication
- [ ] Authorization

## Backstage (DevOps Toolkit)
- [ ] LDAP
- [ ] Kubernetes
- [ ] Grafana
- [ ] Git repo templates

## UI
- [ ] React with OpenLDAP as backend or Backstage
- [ ] CRUD UI
- [ ] CRUD backend OpenLDAP

## Ci/CD
- [ ] ArgoCD
    - [ ] Use a pre-upgrade / pre-install Argo hook to launch
    - [ ] ArgoCD for dev,staging,production environment
    - [ ] KCL Plugin
    - [ ] Vault Plugin
- [X] GitHub actions / worker nodes
- [ ] GitHub modules/submodules
- [ ] Gitea
- [ ] GoReleaser

## Private Artifact Repo
- [ ] Gitea

## Microservice
- [ ] Build 
- [ ] Error handling
- [ ] Logs, traces, audit logs
- [ ] API
- [ ] Authentication
- [ ] Authorization
- [ ] Docker image
- [ ] Private registry
- [ ] Public CI/CD
- [ ] Private CI/CD 

## Backup
- [ ] Backup (Velero) 
    - [ ] etcd
    - [ ] PVs

## K8s 
- [X] Terraform
- [ ] Network (https://www.haproxy.com/blog/using-haproxy-as-an-api-gateway-part-1-introduction)
    - [ ] Hubble
    - [ ] Cloudflare Operator
- [X] Storage
- [X] NFS Provisioner
- [ ] Health Checks (https://blog.kubecost.com/blog/kubernetes-health-check/)
- [X] Gateway/Ingress

## Startup
- [ ] Operately

## K8s Apps
- [X] VS Code (web)
- [X] Gollum
- [ ] GitKraken
- [ ] Mattermost
- [X] eJabberd K8S cluster
- [ ] Web Socket reverse proxy eJabberd
    - [ ] VPN-Tor side car
- [ ] Emisia SVN Repository on VM
- [ ] Nextcloud (Glasskube operators)
- [ ] Odoo (Glasskube operators)
- [ ] OpenProject
- [X] Gollum with local-path provisioner 
- [X] Gollum with storage
- [ ] Full Coder Environment (coder.com)
- [ ] OWASP

# Cert-manager
- [X] LetsEnrypt
- [X] Vault
- [X] Key rotation
- [X] Sealed secrets
- [X] Self-signed CA Issuer for internal apps

## Issues
- [ ] "scripts" folder
- [ ] local vars into proper vars
- [ ] Gateway API

    --set gatewayAPI.enabled=true \
    --set gatewayAPI.enableAlpn=true \
    --set gatewayAPI.enableAppProtocol=true \

# Storage
- [ ] Ceph/Rook/Proxmox/CSI Plugin
- [ ] Type of storage (fast, slow, archive, backup, block, file, object)

# Misc
- [ ] Port trunking, one server in two VLANs??? 
- [ ] ACME SSL certificate for Proxmox cluster
- [ ] ACME SSL certificate for OPNSense
- [ ] Thinkerbell
- [ ] NetBox
- [ ] https://github.com/orgs/home-operations/packages?repo_name=containers
- [ ] Only Proxy Server in DMZ 
- [ ] Email Gateway
- [ ] Firewall ACL based on username, security tags
- [ ] CEF fast forwarding Cisco
- [X] Proxmox UEFI boot
- [ ] Verify #FIXME
- [ ] iPerf3
- [ ] K8s on bare metal vs VMs (hyperconverged) 

# HA K8s
- [ ] Minio HA Cluster
- [ ] PSQL HA Cluster
- [ ] OpenLDAP HA Cluster (https://medium.com/niveus-solutions/how-did-we-manage-to-set-up-openldap-on-gcp-and-migrate-it-part-4-4e735140891d)
- [ ] Redis HA
- [ ] Kube VIP front loadbalancer
- [ ] RBAC (DevOps Toolkit)
- [ ] Mesh (DevOps Toolkit)
- [ ] Canary Release (Gateway API) (DevOps Toolkit)
- [ ] Testing (DevOps Toolkit)
- [ ] Development Environments (DevOps Toolkit)
- [X] HA cluster with embedded etcd (Talos)
- [ ] Mikrotik/pfSense hardening (https://wiki.mikrotik.com/wiki/Manual:Securing_Your_Router#Access_to_a_router)
- [ ] eBPF


