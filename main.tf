resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "nginx-proxy"

  ports {
    internal = 80
    external = 80
  }

  # Montar el archivo de configuración local
  volumes {
    host_path      = "${path.module}/nginx.conf"
    container_path = "/etc/nginx/conf.d/default.conf"
    read_only      = true
  }

  # Si usas Linux y quieres acceder a localhost del host:
  network_mode = "host"
}