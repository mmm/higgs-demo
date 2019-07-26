#
# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

variable "sm11_files" {
  type = list(string)
  default = [
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/0A571FF3-6392-E411-AB3D-0025904B12FC.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/0C7108A5-4892-E411-A91F-002590AC4C6E.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/122F5808-4F92-E411-BCBE-003048F0E518.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/16FCDFCB-6992-E411-B526-00259081A24A.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/2E0071DB-4892-E411-A3EA-0025907FD24A.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/301C8BBD-4292-E411-A188-0025904B12A8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/30612C4A-6692-E411-AE7C-0025904B12A8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/30B3A221-4992-E411-8282-002590DB046C.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/349665AF-5C92-E411-B1E7-0025904B1424.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/34D10D41-6F92-E411-9505-002590DB9214.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/40E40D19-5092-E411-BBAE-0025901D4C94.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/469A16C7-6492-E411-87D6-0025901D4926.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/46C4D56E-5692-E411-B6A2-00266CFFA124.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/487A6B0A-5E92-E411-88AD-0025904B1372.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/4A7274EF-6192-E411-8554-0025904B1446.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/4C524C57-6392-E411-9537-0025904B12A4.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/4C849F63-6D92-E411-A75E-002590DB05F4.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/507A89F2-5E92-E411-BB37-00266CFFA0B0.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/5416D41A-5192-E411-9FCA-00266CFFA124.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/54F2A2BC-7292-E411-A831-002590AC4B1A.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/5A89CDD9-6F92-E411-9F4C-0025904B12A8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/66312CAF-6E92-E411-B382-003048F0E7FC.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/6A50AF33-4E92-E411-8945-0025907DCA72.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/6CB8AE06-4992-E411-81E3-002590494CB2.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/6E0345E4-5A92-E411-85A3-0025901D4940.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/720CB670-4B92-E411-A25D-003048D439BE.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/723CEA7F-3C92-E411-9907-0025904B12A4.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/76BE8381-5C92-E411-AF9B-0025901D4124.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/783AB85D-4B92-E411-AEB6-00266CFFA2EC.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/7847EA20-4992-E411-A24B-00259081A2C8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/78515F6D-5F92-E411-A89D-0025904B12F0.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/7EFD15F5-5A92-E411-A758-0025901D4124.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/8C5BF93F-5292-E411-B05F-003048F0E836.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/9229653B-4E92-E411-A8A8-003048F0E518.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/96F27D81-6892-E411-85D2-00259081A2C8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/A0EFDAF1-4392-E411-AED7-00266CFFA204.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/A6C2549A-6192-E411-84F3-002590AB38DA.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/ACA6BD13-6392-E411-B457-0025907DC9D0.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/B268364B-4F92-E411-8A48-002481E0DDE8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/B6186B01-5B92-E411-A43E-00266CF330B8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/B6CA79CC-4292-E411-A149-00266CF326A8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/BAFF5570-2592-E411-974C-00266CF2718C.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/C04FCBA7-4592-E411-9EED-0025907DC9C4.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/C42CD5BD-4393-E411-B690-002590DB9232.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/C84C7F31-3092-E411-AED3-00266CF32F18.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/D0526DE2-5A92-E411-B2C2-0025904B1026.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/D0AAA6C7-4892-E411-A42D-002481E0DC66.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/D4803EB0-2A92-E411-B9A7-0025904B1364.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/D6A30702-5492-E411-B90C-002481E76372.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/D6E49068-4692-E411-B804-003048D438EA.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/DC3767CD-4892-E411-8931-00266CFFA5CC.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/DE305246-4E92-E411-88DB-00266CF32E78.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/DEA47FB6-4B92-E411-960F-00266CFFA750.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/DEAEBEEF-7892-E411-9E85-0025904B12DE.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/E0769066-7592-E411-829E-0025904B1026.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/E231A6C9-7192-E411-8680-00266CFFA2C4.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/E42A7A37-4E92-E411-97C3-002481E0DAB0.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/E6E12B7C-4E92-E411-8219-002481E0DDE8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/ECDF9F7B-3692-E411-B18F-00266CF2AE10.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/EE7A35CB-7792-E411-A7FB-00266CF327E0.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/F22CD811-6092-E411-ADDE-00266CF33318.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/F2CC2199-4492-E411-AD13-00266CFFA6F8.root",
    "gs/higgs-tutorial/eos/opendata/cms/MonteCarlo2011/Summer11LegDR/ZZTo2e2mu_mll4_7TeV-powheg-pythia6/AODSIM/PU_S13_START53_LV6-v1/00000/F44F8968-6592-E411-8168-0025901D4936.root",
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
