
variable "sm11_files" {
  type = list(string)
  default = [
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/F44F8968-6592-E411-8168-0025901D4936.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/0C7108A5-4892-E411-A91F-002590AC4C6E.root",
  ]
}

module "sm11_jobs" {
  source = "../modules/higgsjob"
  name = "sm11legdrzzto2e2mumll47tev-pw-py600000"
  namespace = var.namespace
  dataset = "sm11legdr_zzto2e2mu_mll4_7tev-pw-py6"
  input_files = var.sm11_files

  CMS_CONFIG = "/configs/demoanalyzer_cfg_level4MC.py"
  GCS_ACCESS = "${var.GCS_ACCESS}"
  GCS_SECRET = "${var.GCS_SECRET}"
  GCS_PROJECT_ID = "${var.GCS_PROJECT_ID}"
  REDIS_HOST = "higgs-redis-svc.${var.namespace}.svc.cluster.local"
}
