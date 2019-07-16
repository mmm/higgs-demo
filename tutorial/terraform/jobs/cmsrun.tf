
variable "cmsrun_input_files" {
  type = list(string)
  default = [
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/20000/1070A5BE-B766-E211-A459-20CF3027A5E2.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/20000/189B37E5-C166-E211-97F9-E0CB4E19F983.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/20000/24C9FA82-5466-E211-AA29-485B39800C16.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/20000/98EBF5A8-4C66-E211-8D0B-485B39800B9D.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/10000/00A78F44-296D-E211-9DE9-20CF305B0535.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/10000/20CC4625-CE6D-E211-9FD9-00261834B55C.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/10000/58D6D152-A16D-E211-A6C1-001EC9D2577D.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/10000/6E548567-D66D-E211-B3FA-90E6BA442EF6.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/10000/749CA4CA-296D-E211-A078-001EC9D7F21F.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/10000/84C75D55-5B6C-E211-9F2B-E0CB4E19F9B5.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/10000/8C86820D-2A6D-E211-B467-E0CB4E553667.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/10000/9AFBA41E-AB6C-E211-ADE2-E0CB4E1A115D.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/10000/CAC93CCF-276D-E211-951A-BCAEC532972B.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/10000/CEB2B52F-DA6C-E211-A7E0-00259073E398.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/10000/E89325B1-9D6C-E211-81A9-001EC9D80771.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/10000/F028D8BE-D66C-E211-AE14-E0CB4E1A1194.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/10000/F2878994-766C-E211-8693-E0CB4EA0A939.root",
    "gs/higgs-tutorial/eos/opendata/cms/Run2012C/DoubleMuParked/AOD/22Jan2013-v1/10000/FA6ED8D4-616C-E211-AC71-20CF305B050B.root",
  ]
}

variable "cmsrun_luminosity_data" {
  type = list(string)
  default = [
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
    "{\"stream\": \"mu_stream_2012\", \"value\": 178306109.36379963}",
  ]
}

module "cmsrun_jobs" {
  source = "../modules/higgsjob"
  name = "cmsrun2012cdoublemuparkedaod22jan2013-v120000"
  namespace = var.namespace
  dataset = "cms_run2012c_doublemuparked_aod_22jan2013-v1"
  input_files = var.cmsrun_input_files
  luminosity_data = var.cmsrun_luminosity_data

  CMS_CONFIG = "/configs/demoanalyzer_cfg_level4data.py"
  GCS_ACCESS = "${var.GCS_ACCESS}"
  GCS_SECRET = "${var.GCS_SECRET}"
  GCS_PROJECT_ID = "${var.GCS_PROJECT_ID}"
  REDIS_HOST = "higgs-redis-svc.${var.namespace}.svc.cluster.local"
}
