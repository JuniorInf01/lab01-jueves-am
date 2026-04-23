# Start a container
resource "docker_container" "db" {
  name  = "db-${terraform.workspace}"
  image = "postgres:15"

  env = [
    "POSTGRES_PASSWORD=1234",
    "POSTGRES_DB=labdb"
  ]

  networks_advanced {
    name = docker_network.lab_net.name
  }

  ports {
    internal = 5432
    external = var.db_port[terraform.workspace]
  }
}