terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0"
        }
    }
}

provider "docker" {}

resource "docker_image" "nginx" {
    name = :nginx:alpine"
}

resource "docker_container" "web" {
    name = "cicd-demo-container"
    image = docker_image.nginx.image_id
    restart = "no"

ports {
    internal = 80
    external = 8081
    }
}

