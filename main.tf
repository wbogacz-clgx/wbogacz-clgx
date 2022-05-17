provider "google" {
  project = "wojtek2020"
  region  = "us-central1"
  zone    = "us-central1-a"
}


# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = "tf1-vm"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  tags         = ["ssh"]

  metadata = {
    enable-oslogin = "TRUE"
  }
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }


  network_interface {
    network = "default"

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}
