resource "docker_container" "web" {
  name  = "web-${terraform.workspace}"
  image = "lab/web"

  networks_advanced {
    name = docker_network.lab_net.name
  }

  ports {
    internal = 80
    external = var.web_port[terraform.workspace]
  }

  depends_on = [docker_container.api]
}