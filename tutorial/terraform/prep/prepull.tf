

resource "kubernetes_daemonset" "prepull" {
  metadata {
    name = "prepull"
    namespace = "${kubernetes_namespace.higgs-tutorial.id}"
  }

  spec {
    selector {
      match_labels = {
        name = "prepull"
      }
    }

    template {
      metadata {
        labels = {
          name = "prepull"
        }
      }

      spec {
        termination_grace_period_seconds = 5
        init_container {
          name  = "prepull"
          image = "gcr.io/mmm-0b85/cms-higgs-4l-full"
          command = ["bash", "-c", "echo", "1"]
        }
        init_container {
          name  = "prepull-worker"
          image = "gcr.io/mmm-0b85/worker"
          command = ["bash", "-c", "echo", "1"]
        }
        container {
          name  = "pause"
          image = "gcr.io/google_containers/pause"
        }
      }
    }
  }
}
