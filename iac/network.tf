resource "docker_network" "lab_net" {
  name = "lab-${terraform.workspace}"
}