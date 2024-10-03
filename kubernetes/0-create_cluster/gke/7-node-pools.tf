resource "google_service_account" "kubernetes" {
  account_id = var.service_account_id
}

resource "google_container_node_pool" "dynamic_node_pools" {
  for_each = { for pool in var.node_pools : pool.name => pool }

  name     = each.value.name
  cluster  = google_container_cluster.primary.id
  node_count = each.value.node_count

  management {
    auto_repair  = each.value.auto_repair
    auto_upgrade = each.value.auto_upgrade
  }
  autoscaling {
    min_node_count = each.value.min_node_count
    max_node_count = each.value.max_node_count
  }

  node_config {
    preemptible  = each.value.preemptible
    machine_type = each.value.machine_type
    
    labels = each.value.labels

    dynamic "taint" {
      for_each = each.value.taint
      content {
        key    = taint.key
        value  = taint.value
        effect = taint.effect
      }
    }
  
    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    disk_size_gb = each.value.disk_size_gb
  }
}
