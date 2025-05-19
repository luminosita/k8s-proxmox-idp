talos_cluster_config = {
  name = "talos-idp"
  # This should point to the vip as below(if nodes on layer 2) or one of the nodes (if nodes not on layer 2)
  # Note: Nodes are not on layer 2 if there is a router between them (even a mesh router)
  #       Not sure how it works if connected to the same router via ethernet (does it act as a switch then???)
  # Ref: https://www.talos.dev/v1.9/talos-guides/network/vip/#requirements
  # Note This is Kubernetes API endpoint. Different from all mentions of Talos endpoints.
  # vip      = "192.168.50.99"
  # The version of talos features to use in generated machine configuration. Generally the same as image version.
  # See https://github.com/siderolabs/terraform-provider-talos/blob/main/docs/data-sources/machine_configuration.md
  region              = "beograd"
  kubernetes_version  = "v1.33.1" 
  gateway_api_version = "v1.2.1"
  cilium = {
    bootstrap_manifest_path = "inline-manifests/cilium-install.yaml.tftpl"
    values_file_path        = "config/cilium/values.yaml.tftpl"
    version                 = "v1.17.4"
  }
  # kubelet    = <<-EOT
  #   extraArgs:
  #     # Needed for Netbird agent https://kubernetes.io/docs/tasks/administer-cluster/sysctl-cluster/#enabling-unsafe-sysctls
  #     allowed-unsafe-sysctls: net.ipv4.conf.all.src_valid_mark
  # EOT
  # api_server = <<-EOT
  #   extraArgs:
  #     oidc-issuer-url: "https://authelia.stonegarden.dev"
  #     oidc-client-id: "kubectl"
  #     oidc-username-claim: "preferred_username"
  #     oidc-username-prefix: "authelia:"
  #     oidc-groups-claim: "groups"
  #     oidc-groups-prefix: "authelia:"
  # EOT
}
