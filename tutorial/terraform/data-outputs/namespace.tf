resource "kubernetes_namespace" "higgs-tutorial" {
  metadata {
    annotations = {
      name = "some-annotation"
    }
    labels = {
      mylabel = "label-value"
    }
    name = "higgs-tutorial"
  }
}
