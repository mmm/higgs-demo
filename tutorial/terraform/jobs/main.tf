
#data "terraform_remote_state" "prep" {
  #backend = "local"

  #config = {
    #path = "${path.module}/../prep/terraform.tfstate"
  #}
#}

resource "kubernetes_deployment" "heater" {
  metadata {
    name = "heater"
    namespace = "higgs-tutorial"
    labels = {
      App = "heater"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "heater"
      }
    }
    template {
      metadata {
        name = "heater"
        namespace = "higgs-tutorial"
        labels = {
          App = "heater"
        }
      }

      spec {
        container {
          image = "markmims/heater"
          name  = "heater"
          port {
            container_port = 80
          }
          env {
            name = "HEATER_THREADS"
            value = "10"
          }
          env {
            name = "HEATER_TIMEOUT"
            value = "10"
          }
          env {
            name = "HEATER_PORT"
            value = "80"
          }
        }
      }
    }
  }
}
