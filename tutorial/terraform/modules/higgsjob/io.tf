
variable "name" {
  default = "myjob"
}
variable "namespace" {
  default = "default"
}
variable "dataset" {
  default = "mydataset"
}
variable "input_files" {
  type = list(string)
  default = []
}


variable "CMS_LUMINOSITY_DATA" {
  default = "null"
}
variable "CMS_JSON" {
  default = "null"
}
variable "CMS_INPUT_FILES" {
  default = "null"
}
variable "CMS_OUTPUT_FILE" {
  default = "/tmp/output.root"
}
variable "CMS_OUTPUT_JSON_FILE" {
  default = "/tmp/output.json"
}
variable "CMS_S3_BASEDIR" {
  default = "gs/higgs-tutorial/testoutputs/higgs4lbucket/run6/eventselection"
}
variable "CMS_OUTPUT_S3PATH" {
  default = ""
}
variable "CMS_CONFIG" {
  default = "/configs/demoanalyzer_cfg_level4MC.py"
}
variable "CMS_DATASET_NAME" {
  default = ""
}
variable "MC_MULTIPART_THREADS" {
  default = "10"
}
variable "S3_ACCESS" {
  default = ""
}
variable "S3_SECRET" {
  default = ""
}
variable "S3_HOST" {
  default = ""
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
variable "DOWNLOAD_MAX_KB" {
  default = "50000"
}
variable "UPLOAD_MAX_KB" {
  default = "10000"
}
variable "REDIS_HOST" {
  default = "higgs-redis-svc.default.svc.cluster.local"
}
variable "DPATH" {
  default = "/dev/shm"
}
