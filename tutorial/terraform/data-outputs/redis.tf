#---
#apiVersion: extensions/v1beta1
#kind: Deployment
#metadata:
  #name: higgs-redis-deployment
#spec:
  #replicas: 1
  #template:
    #metadata:
      #annotations:
      #labels:
        #app: higgs-redis
    #spec:
      #volumes:
      #containers:
      #- name: redis
        #image: redis
        #imagePullPolicy: IfNotPresent
        #resources:
          #requests:
            #cpu: 250m
            #memory: 500Mi
        #ports:
        #- containerPort: 6379
resource "kubernetes_deployment" "redis" {
  metadata {
    name = "higgs-redis-deployment"
    namespace = "${kubernetes_namespace.higgs-tutorial.id}"
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

#---
#apiVersion: v1
#kind: Service
#metadata:
  #annotations:
  #name: higgs-redis-svc
  #labels:
    #app: higgs-redis 
#spec:
  #ports:
  #- port: 6379 
    #name: redis
  #selector:
    #app: higgs-redis
resource "kubernetes_service" "redis" {
  metadata {
    name = "higgs-redis-svc"
    namespace = "${kubernetes_namespace.higgs-tutorial.id}"
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
