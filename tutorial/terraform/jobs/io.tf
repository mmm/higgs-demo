
variable "namespace" {
  default = "higgs-tutorial"
}
variable "GCS_ACCESS" {
  default = ""
}
variable "GCS_SECRET" {
  default = ""
}
variable "GCS_HOST" {
  default = "https://storage.googleapis.com"
}
variable "GCS_PROJECT_ID" {
  default = ""
}
variable "sm11_job_config" {
  type = "map"
  default = {
    BASE_NAME = "myjob"
    CMS_LUMINOSITY_DATA = "null"
    CMS_JSON = "null"
    CMS_INPUT_FILES = "null"
    CMS_OUTPUT_FILE = "/tmp/output.root"
    CMS_OUTPUT_JSON_FILE = "/tmp/output.json"
    CMS_S3_BASEDIR = "gs/higgs-tutorial/testoutputs/higgs4lbucket/run6/eventselection"
    CMS_OUTPUT_S3PATH = ""
    CMS_CONFIG = "/configs/demoanalyzer_cfg_level4MC.py"
    CMS_DATASET_NAME = ""
    MC_MULTIPART_THREADS = "10"
    S3_ACCESS = ""
    S3_SECRET = ""
    S3_HOST = ""
    GCS_ACCESS = ""
    GCS_SECRET = ""
    GCS_HOST = "https://storage.googleapis.com"
    GCS_PROJECT_ID = ""
    DOWNLOAD_MAX_KB = "50000"
    UPLOAD_MAX_KB = "10000"
    REDIS_HOST = "higgs-redis-svc.default.svc.cluster.local"
    DPATH = "/dev/shm"
  }
}
#variable "kubeconfig" {
  #default = ""
#}
#variable "project" {}
#variable "environment" {}
#variable "layer" {}

#variable "region" {}
#variable "state_bucket" {}

#variable "aws_access_key_id" {}
#variable "aws_secret_access_key" {}
#variable "ansible_vault_password" {}
#variable "digitalocean_token" {}

#variable "ssh_keys" {
  #default = []
#}

#variable "heater_image" {
  #default = "markmims/heater:latest"
#}
#variable "heater_name" {
  #default = "simple"
#}
#variable "heater_replicas" {
  #default = 4
#}
#variable "heater_threads_per_replica" {
  #default = 1
#}
#variable "heater_timeout" {
  #default = 10
#}
#variable "heater_port" {
  #default = 80
#}

#output "lb_ip" {
  #value = "${kubernetes_service.heater.load_balancer_ingress.0.ip}"
#}


