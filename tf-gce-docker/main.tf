terraform {
  required_version = ">=1.3.0"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.48, < 8"
    }
  }
}

provider "google" {
  project = "betterwse-analytics"
  region = "europe-north1"
  zone = "europe-north1-a"
}

module "instance_template" {
  source = "terraform-google-modules/vm/google//modules/instance_template"
  project_id = "betterwse-analytics"
  region = "europe-north1"
  
  name_prefix = "tf-module"
  machine_type = "e2-standard-4"

  source_image_family = "debian-12"
  source_image_project = "debian-cloud"
  
  disk_size_gb = 50
  disk_type = "pd-balanced"

  network = "default"
  access_config = [
    {
      network_tier = "STANDARD"
    }
  ]

  tags = ["ssh"]

  metadata = {
  startup-script = <<-EOF
  #!/bin/bash
  apt-get update
  apt-get install -y docker.io docker-compose git
  systemctl start docker
  systemctl enable docker
  mkdir -p /opt 
  git clone -b oli_elk --single-branch https://github.com/OliShah/lia-logstack.git /opt/lia-logstack
  cd /opt/lia-logstack
  docker-compose up -d
  EOF
  }
}
 

module "vm_instance" {
  source = "terraform-google-modules/vm/google//modules/compute_instance"
  instance_template = module.instance_template.self_link
  zone = "europe-north1-a"
}
