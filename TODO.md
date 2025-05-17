## 🏗️ Work in Progress

- [ ] Bash Terminal improvements (DevOps Toolkit)
- [x] Proxmox Network Topography
- [x] Cloudflare Terraform
- [ ] Taskfile (DevOps Toolkit)
- [ ] Renovate (Terraform, Homebrew, Proxmox Apt, Talos, Kubernetes, Cilium, Routers, Argo, Flux) 
- [ ] ArgoCD for dev,staging,production environment
- [ ] Nix Shell
- [ ] App Management (DevOps Toolkit)
- [ ] IDP Playlist (DevOps Toolkit)

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
- [ ] Composition Configuration Package

## Observability (DevOps Toolkit)

- [ ] Grafana Stack 
- [ ] Grafana Alerting

## HA K8s

- [ ] Kube VIP front loadbalancer
- [ ] RBAC (DevOps Toolkit)
- [ ] Mesh (DevOps Toolkit)
- [ ] Canary Release (Gateway API) (DevOps Toolkit)
- [ ] Testing (DevOps Toolkit)
- [ ] Development Environments (DevOps Toolkit)

## Databases

- [ ] OpenLDAP Cluster
- [ ] Minio
- [ ] PSQL (DevOps Toolkit)
- [ ] PSQL Atlas Operator (DevOps Toolkit)

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

## Backstage (DevOps Toolkit)

- [ ] LDAP
- [ ] Kubernetes
- [ ] Grafana
- [ ] Git repo templates

### Misc

- [ ] Port trunking, one server in two VLANs??? 
- [ ] ACME SSL certificate for Proxmox cluster
- [ ] ACME SSL certificate for OPNSense

## Issues

- [ ] "scripts" folder
- [ ] local vars into proper vars
- [ ] Gateway API

    --set gatewayAPI.enabled=true \
    --set gatewayAPI.enableAlpn=true \
    --set gatewayAPI.enableAppProtocol=true \

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



**************** REVIEW ******************



## 🏗️ Work in Progress

- [ ] Cloudflare Terraform
- [x] DNS resolving from internel K8s network to outside (NFS mount with fixed IP)
- [ ] Renovate
- [ ] Remark42
- [ ] Taskfile
- [x] DNS records: internal (VPN, Cloudflare) and external
- [x] Finish README
- [x] Gollum with local-path provisioner 
- [x] Gollum with storage
- [x] Wiki.js
- [x] VSCode with NFS provisioner
- [ ] Full Coder Environment (coder.com)
- [ ] OWASP

# K8s (Proxmox VMs and DigitalOcean for true HA)
- [x] Terraform
- [ ] Network (https://www.haproxy.com/blog/using-haproxy-as-an-api-gateway-part-1-introduction)
    - [ ] Hubble
    - [ ] Cloudflare Operator
- [x] Storage
- [x] NFS Provisioner
- [ ] Health Checks (https://blog.kubecost.com/blog/kubernetes-health-check/)
- [x] Gateway/Ingress

# SSL
- [x] LetsEnrypt
- [x] Key rotation
- [x] Sealed secrets
- [x] Self-signed CA Issuer for internal apps

# Identity Provider (Authentication)
- [x] Keycloak
    - [ ] OpenLDAP
    - [x] Solar
    - [x] ArgoCD
    - [x] Wikijs
    - [ ] Mattermost
    - [ ] NextCloud
    - [ ] OpenProject
    - [x] OpenId Connect
    - [ ] Coder Full Environment (coder.com)
    - [x] oauth2-proxy
    - [ ] API Gateway
        - [ ] Redis
    - [ ] OPA OIDC integration (https://www.openpolicyagent.org/docs/latest/oauth-oidc/)
    - [ ] Key rotation
    - [ ] Revoke token
- [ ] Supabase

# Authorization
- [ ] OPA
 
# Monitoring 
- [ ] Prometheus/Grafana (https://medium.com/@abdullah.eid.2604)
    - [x] Proxmox
    - [x] K8s
    - [ ] Databases
    - [ ] etcd
- [ ] Telemetry/Grafana Tempo (enable tracing for Loki)
    - [x] Telemetry Collector
    - [ ] Connect with logs
    - [ ] Tyk
    - [ ] Auto-injection (https://opentelemetry.io/docs/kubernetes/operator/automatic/, https://github.com/open-telemetry/opentelemetry-operator/)
- [ ] Alertmanager
- [ ] Audit
    - [ ] K8s Audit Logs (https://araji.medium.com/kubernetes-security-monitor-audit-logs-with-grafana-2ab0063906ce)
    - [ ] Tyk Audit Logs
- [ ] Sentry

# Logs
- [x] Aggregated Logs
    - [x] Proxmox
    - [x] K8s
    - [ ] Talos
- [x] Promtail
- [x] Loki (standard vs microservice mode)
- [ ] bitnami/kubernetes-event-exporter
- [ ] Log rotation

# Databases
- [x] Postgre
- [ ] MySql (MariaDB)
- [x] OpenLDAP
- [x] Minio Dev
- [ ] Supabase

# K8s Apps
- [x] VS Code (web)
- [x] Gollum
- [ ] GitKraken
- [ ] Mattermost
- [x] eJabberd K8S cluster
- [ ] Web Socket reverse proxy eJabberd
    - [ ] VPN-Tor side car
- [ ] Emisia SVN Repository on VM
- [ ] Nextcloud (Glasskube operators)
- [ ] Odoo (Glasskube operators)
- [ ] OpenProject

# API Gateway
- [ ] Tyk/KrakenD
    - [ ] API Audit
    - [ ] Custom Operator
    - [ ] Goplugins
    - [ ] Authentication
    - [ ] Authorization

# Private Artifact Repo
- [ ] Nexus Repository
- [ ] Nexus SBOM
- [ ] Nexus IQ Server

# Ci/CD
- [x] GitHub actions / worker nodes
- [ ] GitHub modules/submodules
- [ ] GitLab CI/CD
- [x] ArgoCD
- [ ] Upload to Nexus

# Microservice
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

# Backup
- [ ] Backup (Velero) 
    - [ ] etcd
    - [ ] PVs

# Startup
- Operately

# HA K8s
- [x] HA cluster with embedded etcd (Talos)
- [ ] Kube VIP front loadbalancer
- [ ] BGP
- [ ] RBAC
- [ ] Mesh
- [ ] Mikrotik/pfSense hardening (https://wiki.mikrotik.com/wiki/Manual:Securing_Your_Router#Access_to_a_router)
- [ ] eBPF

# DCIM
- [ ] Thinkerbell
- [ ] NetBox

# Storage
- [ ] Ceph/Rook/Proxmox/CSI Plugin
- [ ] Type of storage (fast, slow, archive, backup, block, file, object)

# Misc
- [ ] K8s on bare metal vs VMs (hyperconverged) 
- [ ] Build Cache for Android compilation and Gradle Android apps
https://blog.gradle.org/remote-and-distributed-build-patterns
- [ ] DistCC
https://www.linux-magazine.com/Online/Features/Distributed-Compiling-with-distcc

