
variable "sm12_files" {
  type = list(string)
  default = [
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/029D759D-6CD9-E211-B3E2-1CC1DE041FD8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/02A8CA7F-52D9-E211-9260-1CC1DE1D1F80.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/0824586C-4CD9-E211-87B3-1CC1DE041FD8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/22FD6176-5ED9-E211-818D-AC162DACE1B8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/24DB66A2-4DD9-E211-BAE1-00266CFEFC38.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/281F76A2-23D9-E211-BB68-1CC1DE04FF50.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/28CDF98C-43D9-E211-ADB8-00266CFFCAC0.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/32C0B5E3-5BD9-E211-B275-1CC1DE1CDF2A.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/387184FD-4DD9-E211-A8CC-00266CFFBF64.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/3C72440D-60D9-E211-87B8-008CFA052A88.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/421ABD63-51D9-E211-81B4-AC162DA87230.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/42D7D08F-45D9-E211-9754-00266CFFCD60.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/5623F7A5-67D9-E211-83A2-1CC1DE05B0C8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/5E1BF8AC-64D9-E211-87D9-008CFA0527CC.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/640458BB-48D9-E211-8684-78E7D1E49636.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/72F33A13-66D9-E211-A928-00266CFEFDEC.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/7C717FB0-38D9-E211-9D3B-00266CFFC9EC.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/86AF48A1-68D9-E211-9E4C-00266CFFBED8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/8C00288B-57D9-E211-AA17-D485645C8BC8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/942A698C-47D9-E211-8E87-1CC1DE052068.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/9689388B-4FD9-E211-91ED-1CC1DE04FF48.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/9A28FC69-50D9-E211-94D5-00266CFFCB14.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/9A5F5551-51D9-E211-99B2-00266CFFC51C.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/AC79DD3E-55D9-E211-95D5-1CC1DE1D14A0.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/BE525F74-53D9-E211-AB10-00266CFE6404.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/C4956C23-67D9-E211-BE12-AC162DA87230.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/CA308B89-4BD9-E211-9175-AC162DACC3E8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/CABC0B0A-73D9-E211-B2C9-00266CFFC940.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/DC9542DD-55D9-E211-898A-00266CFFCD6C.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/DCA5DF96-4ED9-E211-8AED-1CC1DE046F78.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/EAF03D95-75D9-E211-84D6-1CC1DE04FF98.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/EE8E8C06-73D9-E211-8FF9-1CC1DE046FC0.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/F01FC321-61D9-E211-8A71-00266CFFCD6C.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2012/Summer12_DR53X/SMHiggsToZZTo4L_M-125_8TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S10_START53_V19-v1/10000/F8333E82-64D9-E211-8DF3-00266CFEFDEC.root",
  ]
}

module "sm12_jobs" {
  source = "../modules/higgsjob"
  name = "sm12dr53xsmhiggstozzto4lm-1258tev-pw15-j3-py610000"
  namespace = var.namespace
  dataset = "sm12_dr53x_smhiggstozzto4l_m-125_8tev-pw15-j3-py6"
  input_files = var.sm12_files

  CMS_CONFIG = "/configs/demoanalyzer_cfg_level4MC.py"
  GCS_ACCESS = "${var.GCS_ACCESS}"
  GCS_SECRET = "${var.GCS_SECRET}"
  GCS_PROJECT_ID = "${var.GCS_PROJECT_ID}"
  REDIS_HOST = "higgs-redis-svc.${var.namespace}.svc.cluster.local"
}
