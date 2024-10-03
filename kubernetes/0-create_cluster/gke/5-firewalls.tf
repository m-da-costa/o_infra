resource "google_compute_firewall" "allow-ssh" {
  name    = var.firewall_allow_ssh_name
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.global_source_ranges
}

resource "google_compute_firewall" "allow_ingress_from_iap" {
  name = var.firewall_allow_ingress_from_iap_name
  network = var.network_name
  direction = "INGRESS"
  source_ranges = var.iap_source_ranges

  allow {
    protocol = "tcp"
    ports = ["32147"]
  }
}

resource "google_compute_firewall" "allow-80" {
  name    = var.firewall_allow_80_name
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = var.global_source_ranges
}

resource "google_compute_firewall" "allow-443" {
  name    = var.firewall_allow_443_name
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = var.global_source_ranges
}

resource "google_compute_firewall" "worker_node_access" {
  name        = var.firewall_worker_node_access_name
  network = var.network_name
  direction   = "INGRESS"
  priority    = 1000
  source_ranges      = var.global_source_ranges
  destination_ranges = var.global_source_ranges
  allow {
    protocol = "tcp"
    ports    = var.worker_node_ports
  }
}
