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

resource "random_string" "jupytertoken" {
  length = 48
  special = false
}

resource "kubernetes_secret" "jupytertoken" {
  metadata {
    name = "jupytertoken"
    namespace = "${var.namespace}"
  }

  data = {
    token = "${random_string.jupytertoken.result}"
  }
}

resource "kubernetes_deployment" "jupyter" {
  metadata {
    name = "higgs-nb-deployment"
    namespace = "${var.namespace}"
    #labels = {
      #app = "higgs-nb"
    #}
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "higgs-nb"
      }
    }

    template {
      metadata {
        labels = {
          app = "higgs-nb"
        }
      }

      spec {
        container {
          image = "${var.notebook-image}"
          name  = "notebook"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 8888
          }
          env {
            name = "REDIS_HOST"
            value = "higgs-redis-svc.${var.namespace}.svc.cluster.local"
          }
          command = ["jupyter"]
          args = [
            "notebook",
            "--no-browser",
            "--port=8888",
            "--ip=0.0.0.0",
            "--allow-root",
            "--NotebookApp.token=${random_string.jupytertoken.result}"
          ]
        }
      }
    }
  }
}

resource "kubernetes_service" "jupyter" {
  metadata {
    name = "higgs-nb-svc"
    namespace = "${var.namespace}"
    labels = {
      app = "higgs-nb"
    }
  }
  spec {
    selector = {
      app = "higgs-nb"
    }
    port {
      port = 8888
      name = "jupyter"
    }
    type = "LoadBalancer"
  }
}
