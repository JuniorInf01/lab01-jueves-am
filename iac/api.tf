# Start a container
resource "docker_container" "api" {
  name  = "api-${terraform.workspace}"
  image = "lab/api"

  networks_advanced {
    name = docker_network.lab_net.name
  }

  ports {
    internal = 3000
    external = var.api_port[terraform.workspace]
  }

  env = [
    "DB_HOST=db-${terraform.workspace}",
    "DB_PORT=5432"
  ]

  depends_on = [docker_container.db]
}