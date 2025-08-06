terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_container" "ngrok" {
  image = "ngrok/ngrok:latest"
  name  = "ngrok-tunnel"

  # Conecta el contenedor a la red del host (solo Linux)
  network_mode = "host"

  # Variables de entorno para ngrok
  env = [
    "NGROK_AUTHTOKEN=${var.ngrok_authtoken}"
  ]

  # Comando corregido para exponer el puerto 4000
  command = [
    "http",
    "4000",  # Solo el puerto cuando se usa network_mode=host
    "--log=stdout"
  ]
}

variable "ngrok_authtoken" {
  description = "Tu authtoken de ngrok"
  type        = string
}