
variable "dataset" {
  default = "sm11legdr_zzto2e2mu_mll4_7tev-pw-py6"
}
variable "basejobname" {
  default = "sm11legdrzzto2e2mumll47tev-pw-py600000"
}

module "higgsjob-0001" {
  source = "../modules/higgsjob"
  #name = "sm11legdrzzto2e2mumll47tev-pw-py600000-0001"
  name = "${var.basejobname}-0001"
  namespace = "${var.namespace}"

  CMS_INPUT_FILES = "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/F44F8968-6592-E411-8168-0025901D4936.root"
  #CMS_OUTPUT_S3PATH = "sm11legdr_zzto2e2mu_mll4_7tev-pw-py6-0001.json"
  CMS_OUTPUT_S3PATH = "${var.dataset}-0001.json"
  CMS_CONFIG = "/configs/demoanalyzer_cfg_level4MC.py"
  #CMS_DATASET_NAME = "sm11legdr_zzto2e2mu_mll4_7tev-pw-py6"
  CMS_DATASET_NAME = "${var.dataset}"
  GCS_ACCESS = "${var.GCS_ACCESS}"
  GCS_SECRET = "${var.GCS_SECRET}"
  GCS_PROJECT_ID = "${var.GCS_PROJECT_ID}"
  REDIS_HOST = "higgs-redis-svc.${var.namespace}.svc.cluster.local"
}

module "higgsjob-0002" {
  source = "../modules/higgsjob"
  #name = "sm11legdrzzto2e2mumll47tev-pw-py600000-0002"
  name = "${var.basejobname}-0002"
  namespace = "${var.namespace}"

  CMS_INPUT_FILES = "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/0C7108A5-4892-E411-A91F-002590AC4C6E.root"
  #CMS_OUTPUT_S3PATH = "sm11legdr_zzto2e2mu_mll4_7tev-pw-py6-0002.json"
  CMS_OUTPUT_S3PATH = "${var.dataset}-0002.json"
  CMS_CONFIG = "/configs/demoanalyzer_cfg_level4MC.py"
  #CMS_DATASET_NAME = "m11legdr_zzto2e2mu_mll4_7tev-pw-py6"
  CMS_DATASET_NAME = "${var.dataset}"
  GCS_ACCESS = "${var.GCS_ACCESS}"
  GCS_SECRET = "${var.GCS_SECRET}"
  GCS_PROJECT_ID = "${var.GCS_PROJECT_ID}"
  REDIS_HOST = "higgs-redis-svc.${var.namespace}.svc.cluster.local"
}
