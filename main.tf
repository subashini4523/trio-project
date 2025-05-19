provider "docker" {}

resource "docker_image" "trio" {
  name         = "trio-app"
  build {
    context    = "${path.module}/.."
  }
}

resource "docker_container" "trio" {
  image = docker_image.trio.latest
  name  = "trio-container"
  ports {
    internal = 5000
    external = 5000
  }
}
