set shell := ["bash", "-c"]
set dotenv-load := true
set positional-arguments := true

default:
  just --list

k3s-install:
  ssh milosh@k3s.local 'bash k3s-install.sh'
  mkdir -p tmp
  scp milosh@k3s.local:./.kube/config tmp/kubeconfig.tmp
  bash /usr/local/bin/patch-kubeconfig.sh tmp/kubeconfig.tmp
  rm -f tmp/kubeconfig.tmp

k3s-uninstall:
  ssh milosh@k3s.local '/usr/local/bin/k3s-uninstall.sh'

base-crossplane arg1:
  kustomize build k8s/infra/controllers/crossplane --enable-helm | kubectl $arg1 -f -
  sleep 5

_base:
  kubectl config use-context $KUBECTL_CONTEXT

vault arg1: _base
  kustomize build k8s/infra/auth/vault/overlays/$OVERLAY --enable-helm | kubectl $arg1 -f -

vault-crossplane arg1:
  @base-crossplane $arg1
  kubectl $1 -f k8s/infra/auth/vault/crossplane/providers
  sleep 5 #Wait for Vault provider CRDs to deploy
  kubectl $1 -f k8s/infra/auth/vault/crossplane/config
  kubectl $1 -f k8s/infra/auth/vault/crossplane/compositions
  kubectl $1 -f k8s/infra/auth/vault/crossplane/resources

databases args:
  kustomize build k8s/infra/database/cnpg/overlays/$OVERLAY --enable-helm | kubectl $1 -f -
  kustomize build k8s/infra/database/minio/overlays/$OVERLAY --enable-helm | kubectl $1 -f -

