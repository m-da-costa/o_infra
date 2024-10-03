variable "project_id" {
  type        = string
  description = "The ID of the Google Cloud project."
}

variable "private_ip_range_prefix" {
  type        = number
  description = "The prefix length of the private IP range."
  default     = 16
}

variable "region" {
  type        = string
  description = "The region to deploy the resources in."
  default     = "us-central1"
}
variable "zone" {
  type        = string
  description = "The zone to deploy the resources in."
  default     = "us-central1-a"
}

variable "location" {
  description = "The location for the Kubernetes cluster"
  default     = "us-central1-a"
}

variable "network_name" {
  type        = string
  description = "The name of the VPC network."
  default     = "main"
}

variable "sql_instance_name" {
  type        = string
  description = "The name of the Cloud SQL instance."
  default     = "sql-db"
}

variable "sql_database_name" {
  type        = string
  description = "The name of the Cloud SQL database."
  default     = "test0"
}

variable "sql_user_name" {
  type        = string
  description = "The name of the Cloud SQL user."
  default     = "admin"
}

variable "sql_user_password" {
  type        = string
  description = "The password for the Cloud SQL user."
}

variable "database_version" {
  type        = string
  description = "The version of the Cloud SQL database."
  default     = "MYSQL_8_0"
}

variable "authorized_networks" {
  description = "The list of IP addresses authorized to access the SQL."
  type = list(object({
    name  = string
    value = string
  }))
  default = [
    {
      name  = "user1"
      value = "0.0.0.1" # add external ips
    },
    {
      name  = "user2"
      value = "0.0.0.2" # add external ips
    },
  ]
}

variable "db_instance_tier" {
  type        = string
  description = "The tier of the Cloud SQL instance."
  default     = "db-n1-standard-1" #too big for now
}
variable "service_account_id" {
  type        = string
  description = "The service account ID for the Kubernetes cluster."
  default     = "kubernetes"
}

variable "cluster_id" {
  description = "The cluster identifier."
}

variable "node_pools" {
  description = "A list of node pools configuration."
  type = list(object({
    name           = string
    node_count     = number
    auto_repair    = bool
    auto_upgrade   = bool
    min_node_count = number
    max_node_count = number
    preemptible    = bool
    machine_type   = string
    labels         = map(string)
    taint          = map(string)
    disk_size_gb   = number
  }))
  default = []
}

variable "logging_service" {
  type        = string
  description = "The logging service for the Kubernetes cluster"
  default     = "logging.googleapis.com/kubernetes"
}

variable "monitoring_service" {
  type        = string
  description = "The monitoring service for the Kubernetes cluster"
  default     = "monitoring.googleapis.com/kubernetes"
}

variable "networking_mode" {
  type        = string
  description = "The networking mode for the Kubernetes cluster"
  default     = "VPC_NATIVE"
}

variable "http_load_balancing_disabled" {
  type        = bool
  description = "Whether to disable HTTP load balancing for the Kubernetes cluster"
  default     = true
}

variable "horizontal_pod_autoscaling_disabled" {
  type        = bool
  description = "Whether to disable horizontal pod autoscaling for the Kubernetes cluster"
  default     = false
}

variable "release_channel" {
  type        = string
  description = "The release channel for the Kubernetes cluster"
  default     = "REGULAR"
}

variable "logging_service" {
  type        = string
  description = "The logging service for the Kubernetes cluster"
  default     = "logging.googleapis.com/kubernetes"
}

variable "monitoring_service" {
  description = "The monitoring service for the Kubernetes cluster"
  default     = "monitoring.googleapis.com/kubernetes"
}

variable "networking_mode" {
  description = "The networking mode for the Kubernetes cluster"
  default     = "VPC_NATIVE"
}

variable "http_load_balancing_disabled" {
  description = "Whether to disable HTTP load balancing for the Kubernetes cluster"
  default     = true
}

variable "horizontal_pod_autoscaling_disabled" {
  description = "Whether to disable horizontal pod autoscaling for the Kubernetes cluster"
  default     = false
}

variable "release_channel" {
  description = "The release channel for the Kubernetes cluster"
  default     = "REGULAR"
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  default     = "primary"
}

variable "initial_node_count" {
  description = "The initial number of nodes in the Kubernetes cluster"
  default     = 1
}

variable "network_self_link" {
  description = "The self link of the Google Compute network"
}

variable "subnetwork_self_link" {
  description = "The self link of the Google Compute subnetwork"
}

variable "workload_pool" {
  description = "The workload pool for Kubernetes workload identity"
  default     = "production-cpp.svc.id.goog"
}

variable "master_ipv4_cidr_block" {
  description = "The IPv4 CIDR block for the Kubernetes cluster master"
  default     = "172.16.0.0/28"
}

variable "cluster_secondary_range_name" {
  description = "The name of the secondary range for the cluster"
  default     = "k8s-pod-range"
}

variable "services_secondary_range_name" {
  description = "The name of the secondary range for Kubernetes services"
  default     = "k8s-service-range"
}

variable "enable_private_nodes" {
  description = "Enable or disable private nodes in the cluster"
  default     = true
}

variable "enable_private_endpoint" {
  description = "Enable or disable private endpoint in the cluster"
  default     = false
}

variable "network_name" {
  description = "The name of the primary network."
}

variable "firewall_allow_ssh_name" {
  description = "The name for allow-ssh firewall rule."
}

variable "firewall_allow_ingress_from_iap_name" {
  description = "The name for allow-ingress-from-iap firewall rule."
}

variable "firewall_allow_80_name" {
  description = "The name for allow-80 firewall rule."
}

variable "firewall_allow_443_name" {
  description = "The name for allow-443 firewall rule."
}

variable "firewall_worker_node_access_name" {
  description = "The name for worker-node-access firewall rule."
}

variable "iap_source_ranges" {
  description = "The source ranges for Identity-Aware Proxy (IAP) access."
  type        = list(string)
}

variable "global_source_ranges" {
  description = "The global source ranges for public access."
  type        = list(string)
}

variable "worker_node_ports" {
  description = "The ports for worker node access."
  type        = list(string)
}
