resource "kubernetes_job" "sm11job" {
  metadata {
    name = "sm11legdrzzto2e2mumll47tev-pw-py600000-0001"
    namespace = "higgs-tutorial"
  }
  spec {
    template {
      metadata {}
      spec {
        termination_grace_period_seconds = 5
        restart_policy = "Never"
        share_process_namespace = true

        init_container {
          name = "prepull"
          image = "gcr.io/mmm-0b85/worker"
          command = [ "bash", "-c", "/getfile.sh" ]
          env {
            name = "CMS_INPUT_FILES"
            value = "${var.sm11_job_config.CMS_INPUT_FILES}"
          }
          env {
            name = "GCS_ACCESS"
            value = "${var.sm11_job_config.GCS_ACCESS}"
          }
          env {
            name = "GCS_SECRET"
            value = "${var.sm11_job_config.GCS_SECRET}"
          }
          env {
            name = "GCS_HOST"
            value = "${var.sm11_job_config.GCS_HOST}"
          }
          env {
            name = "GCS_PROJECT_ID"
            value = "${var.sm11_job_config.GCS_PROJECT_ID}"
          }
          env {
            name = "DOWNLOAD_MAX_KB"
            value = "${var.sm11_job_config.DOWNLOAD_MAX_KB}"
          }
          env {
            name = "UPLOAD_MAX_KB"
            value = "${var.sm11_job_config.UPLOAD_MAX_KB}"
          }
          env {
            name = "DPATH"
            value = "${var.sm11_job_config.DPATH}"
          }

          resources {
            requests {
              cpu = "0.9"
              memory = "6Gi"
            }
            limits {
              cpu = "0.9"
              memory = "6Gi"
            }
          }

          volume_mount {
            mount_path = "/getfile.sh"
            sub_path = "getfile.sh"
            name = "getfile"
          }
          volume_mount {
            mount_path = "/inputs"
            name = "inputs"
          }
        }
        container {
          name = "cmsrun"
          image = "gcr.io/mmm-0b85/cms-higgs-4l-full"
          command = [ "bash", "-c", "/runjob.sh" ]

          env {
            name = "CMS_LUMINOSITY_DATA"
            value = "${var.sm11_job_config.CMS_LUMINOSITY_DATA}"
          }
          env {
            name = "CMS_JSON"
            value = "${var.sm11_job_config.CMS_JSON}"
          }
          env {
            name = "CMS_INPUT_FILES"
            value = "${var.sm11_job_config.CMS_INPUT_FILES}"
          }
          env {
            name = "CMS_OUTPUT_FILE"
            value = "${var.sm11_job_config.CMS_OUTPUT_FILE}"
          }
          env {
            name = "CMS_OUTPUT_JSON_FILE"
            value = "${var.sm11_job_config.CMS_OUTPUT_JSON_FILE}"
          }
          env {
            name = "CMS_S3_BASEDIR"
            value = "${var.sm11_job_config.CMS_S3_BASEDIR}"
          }
          env {
            name = "CMS_OUTPUT_S3PATH"
            value = "${var.sm11_job_config.CMS_OUTPUT_S3PATH}"
          }
          env {
            name = "CMS_CONFIG"
            value = "${var.sm11_job_config.CMS_CONFIG}"
          }
          env {
            name = "CMS_DATASET_NAME"
            value = "${var.sm11_job_config.CMS_DATASET_NAME}"
          }
          env {
            name = "MC_MULTIPART_THREADS"
            value = "${var.sm11_job_config.MULTIPART_THREADS}"
          }
          env {
            name = "S3_ACCESS"
            value = "${var.sm11_job_config.S3_ACCESS}"
          }
          env {
            name = "S3_SECRET"
            value = "${var.sm11_job_config.S3_SECRET}"
          }
          env {
            name = "S3_HOST"
            value = "${var.sm11_job_config.S3_HOST}"
          }
          env {
            name = "GCS_ACCESS"
            value = "${var.sm11_job_config.GCS_ACCESS}"
          }
          env {
            name = "GCS_SECRET"
            value = "${var.sm11_job_config.GCS_SECRET}"
          }
          env {
            name = "GCS_HOST"
            value = "${var.sm11_job_config.GCS_HOST}"
          }
          env {
            name = "GCS_PROJECT_ID"
            value = "${var.sm11_job_config.GCS_PROJECT_ID}"
          }
          env {
            name = "DOWNLOAD_MAX_KB"
            value = "${var.sm11_job_config.DOWNLOAD_MAX_KB}"
          }
          env {
            name = "UPLOAD_MAX_KB"
            value = "${var.sm11_job_config.UPLOAD_MAX_KB}"
          }
          env {
            name = "REDIS_HOST"
            value = "${var.sm11_job_config.REDIS_HOST}"
          }
          env {
            name = "DPATH"
            value = "${var.sm11_job_config.DPATH}"
          }

          resources {
            requests {
              cpu = "0.9"
              memory = "6Gi"
            }
            limits {
              cpu = "0.9"
              memory = "6Gi"
            }
          }

          volume_mount {
            mount_path = "/runjob.sh"
            sub_path = "runjob.sh"
            name = "runjob"
          }
          volume_mount {
            mount_path = "/inputs"
            name = "inputs"
          }

        }

        volume {
          name = "runjob"
          config_map {
            name = "runjob"
            default_mode = "0755"
          }
        }
        volume {
          name = "getfile"
          config_map {
            name = "getfile"
            default_mode = "0755"
          }
        }
        volume {
          name = "inputs"
          empty_dir {
            medium = "Memory"
          }
        }

      }
    }
    backoff_limit = 5
    completions = 1
    parallelism = 1
  }
}
