service_account_id = "kubernetes"
cluster_id         = "cluster0"

node_pools = [
  {
    name           = "general"
    node_count     = 1
    auto_repair    = true
    auto_upgrade   = true
    min_node_count = 1
    max_node_count = 4
    preemptible    = false
    machine_type   = "e2-small"
    labels         = { role = "general" }
    taint          = {}
    disk_size_gb   = 15
  },
  # Add more node pools here if needed
]

network_name                         = "main"
firewall_allow_ssh_name              = "allow-ssh"
firewall_allow_ingress_from_iap_name = "allow-ingress-from-iap"
firewall_allow_80_name               = "allow-80"
firewall_allow_443_name              = "allow-443"
firewall_worker_node_access_name     = "worker-node-access"
iap_source_ranges                    = ["0.0.0.0/20"]
global_source_ranges                 = ["0.0.0.0/0"]
worker_node_ports                    = ["8443"]
