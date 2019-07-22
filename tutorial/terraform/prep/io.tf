output "jupytertoken" {
  value = "${random_string.jupytertoken.result}"
}
