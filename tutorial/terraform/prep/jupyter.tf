

resource "random_string" "jupytertoken" {
  length = 48
  special = false
}

resource "kubernetes_secret" "jupytertoken" {
  metadata {
    name = "jupytertoken"
    namespace = "${kubernetes_namespace.higgs-tutorial.id}"
  }

  data = {
    token = "${random_string.jupytertoken.result}"
  }
}

#---
#apiVersion: extensions/v1beta1
#kind: Deployment
#metadata:
  #name: higgs-nb-deployment
#spec:
  #replicas: 1
  #template:
    #metadata:
      #annotations:
      #labels:
        #app: higgs-nb
    #spec:
      #volumes:
      #containers:
      #- name: notebook
        #image: gcr.io/mmm-0b85/notebook
        #imagePullPolicy: IfNotPresent
        #env:
        #- name: REDIS_HOST
          #value: higgs-redis-svc.default.svc.cluster.local
        #command: ["jupyter"]
        #args: ["notebook", "--no-browser", "--port=8888", "--ip=0.0.0.0", "--allow-root"]
        ##resources:
          ##requests:
            ##cpu: 250m
            ##memory: 500Mi
        #ports:
        #- containerPort: 8888
resource "kubernetes_deployment" "jupyter" {
  metadata {
    name = "higgs-nb-deployment"
    namespace = "${kubernetes_namespace.higgs-tutorial.id}"
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
          #image = "gcr.io/mmm-0b85/notebook"
          image = "lukasheinrich/higgsplot:20190715"
          name  = "notebook"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 8888
          }
          env {
            name = "REDIS_HOST"
            value = "higgs-redis-svc.${kubernetes_namespace.higgs-tutorial.id}.svc.cluster.local"
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

#---
#apiVersion: v1
#kind: Service
#metadata:
  #annotations:
  #name: higgs-nb-svc
  #labels:
    #app: higgs-nb
#spec:
  #ports:
  #- port: 8888 
    #name: jupyter
  #selector:
    #app: higgs-nb
resource "kubernetes_service" "jupyter" {
  metadata {
    name = "higgs-nb-svc"
    namespace = "${kubernetes_namespace.higgs-tutorial.id}"
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
  }
}
