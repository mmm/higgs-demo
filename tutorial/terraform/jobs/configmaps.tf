
#data "terraform_remote_state" "prep" {
  #backend = "local"

  #config = {
    #path = "${path.module}/../prep/terraform.tfstate"
  #}
#}

resource "kubernetes_config_map" "getfile" {
  metadata {
    name = "getfile"
    namespace = "higgs-tutorial"
  }

  data = {
    "getfile.sh" = "${file("${path.module}/getfile.sh")}"
  }
}

resource "kubernetes_config_map" "runjob" {
  metadata {
    name = "runjob"
    namespace = "higgs-tutorial"
  }

  data = {
    "runjob.sh" = "${file("${path.module}/runjob.sh")}"
  }
}
