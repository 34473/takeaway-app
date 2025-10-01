# Build Docker image from local Dockerfile
resource "docker_image" "flask" {
  name = "flask-hello:latest"
  build {
    context = "${path.module}"   # build in current folder
    dockerfile = "${path.module}/Dockerfile"
  }
}

# Run container from that image
resource "docker_container" "flask" {
  name  = "flask_container"
  image = docker_image.flask.name
  ports {
    internal = 5000
    external = 5000
  }
}
