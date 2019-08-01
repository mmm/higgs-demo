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

variable "gcp-region" {
  default = "us-central1"
}

variable "k8s-cluster-name" {
  default = "higgs-tutorial"
}

variable "k8s-cluster-node-count" {
  default = "1" # in each of three zones by default
}

variable "k8s-cluster-node-type" {
  default = "n1-highmem-16"
}

variable "k8s-cluster-subnet-ipv4-cidr" {
  default = "10.110.0.0/21" # arbitrary
}

variable "k8s-min-version" {
  default = "1.12.8-gke.10"
}


output "k8s-cluster-name" {
  value = "${google_container_cluster.higgs-tutorial.name}"
}

output "k8s-credentials-cmd" {
  value = "gcloud container clusters get-credentials ${google_container_cluster.higgs-tutorial.name} --region ${var.gcp-region}"
}
