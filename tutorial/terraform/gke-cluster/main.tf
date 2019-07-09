

#gcloud container clusters create
  #--quiet
  #--async
  #--no-enable-basic-auth
  #--no-issue-client-certificate
  #--disk-size 90
  #--disk-type pd-ssd
  #--image-type cos
  #--machine-type {0}
  #--num-nodes {1}
  #--region {2}
  #--cluster-version 1.12.8-gke.10
  #--metadata disable-legacy-endpoints=true
  #--no-enable-cloud-logging
  #--no-enable-cloud-monitoring
  #--no-enable-autorepair
  #--enable-ip-alias
  #--create-subnetwork name={3},range=10.{4}.0.0/21
  #--local-ssd-count {5}
  #{3}
#.format(
    #ds['flavor'],
    #ds['nodes'],
    #parsed_args.gcs_region,
    #cname,
    #(110+i),
    #local_ssd_count)

resource "google_container_cluster" "kubecon-demo-0" {
  name               = "kubecon-demo-0"
  location           = "us-central1"
  initial_node_count = 3
  logging_service = "none"
  monitoring_service = "none"
  min_master_version = "1.12.8-gke.10"

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  ip_allocation_policy {
    create_subnetwork = true
    subnetwork_name = "kubecon-demo-0"
    node_ipv4_cidr_block = "10.110.0.0/21"
    use_ip_aliases = true
  }

  node_config {
    disk_size_gb = 90
    disk_type = "pd-ssd"
    image_type = "cos"
    local_ssd_count = 1
    machine_type = "n1-highmem-16"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    #oauth_scopes = [
      #"https://www.googleapis.com/auth/logging.write",
      #"https://www.googleapis.com/auth/monitoring",
    #]


    labels = {
      foo = "bar"
    }

    tags = ["foo", "bar"]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}
