variable "container_app_environment_name" {
    description = "The name of the container app environment"
    type        = string
}

variable "environment" {
    description = "The environment of the container app environment"
    type        = string
}

variable "location" {
    description = "The location of the container app environment"
    type        = string  
}

variable "resource_group_name" {
    description = "The name of the resource group"
    type        = string
}

variable "DOCKER_REGISTRY_SERVER_URL" {
    description = "The URL of the Docker registry server"
    type        = string
}

variable "DOCKER_REGISTRY_SERVER_USERNAME" {
    description = "The username of the Docker registry server"
    type        = string
}

variable "DOCKER_REGISTRY_SERVER_PASSWORD" {
    description = "The password of the Docker registry server"
    type        = string
}

variable "revision_mode" {
    description = "The revision mode of the container app"
    type        = string
}

variable "container_app_name" {
    description = "The name of the container app"
    type        = string 
}
