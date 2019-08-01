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

resource "kubernetes_deployment" "redis" {
  metadata {
    name = "higgs-redis-deployment"
    namespace = "${var.namespace}"
    #labels = {
      #app = "higgs-redis"
    #}
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "higgs-redis"
      }
    }

    template {
      metadata {
        labels = {
          app = "higgs-redis"
        }
      }

      spec {
        container {
          image = "redis"
          name  = "redis"
          image_pull_policy = "IfNotPresent"
          resources {
            requests {
              cpu = "250m"
              memory = "500Mi"
            }
          }
          port {
            container_port = 6379
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "redis" {
  metadata {
    name = "higgs-redis-svc"
    namespace = "${var.namespace}"
    labels = {
      app = "higgs-redis"
    }
  }
  spec {
    selector = {
      app = "higgs-redis"
    }
    port {
      port = 6379
      name = "redis"
    }
  }
}
