provider "docker" {}

resource "docker_image" "jenifer" {
  name         = "jenifer-app"
  build {
    context    = "${path.module}/.."
  }
}

resource "docker_container" "jenifer" {
  image = docker_image.jenifer.latest
  name  = "jenifer-container"
  ports {
    internal = 5000
    external = 5000
  }
}
