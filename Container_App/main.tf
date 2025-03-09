resource "azurerm_container_app_environment" "container_app_env" {
    name                = var.container_app_environment_name
    location            = var.location
    resource_group_name = var.resource_group_name

    tags = {
        environment = var.environment
    }
}

resource "azurerm_container_app" "container_app" {
    depends_on = [ azurerm_container_app_environment.container_app_env ]
    name                = var.container_app_name
    resource_group_name = var.resource_group_name
    container_app_environment_id = azurerm_container_app_environment.container_app_env.id
    revision_mode = var.revision_mode

    identity {
      type = "UserAssigned"
      identity_ids = [ var.identityId ]
    }

    template {
        container {
            name = "example-container"
            image = "nginx:latest"
            cpu = "0.25"
            memory = "0.5Gi"

            # env {
            #     name  = "DOCKER_REGISTRY_SERVER_URL"
            #     value = var.DOCKER_REGISTRY_SERVER_URL
            # }
            
            # env {
            #     name  = "DOCKER_REGISTRY_SERVER_USERNAME"
            #     value = var.DOCKER_REGISTRY_SERVER_USERNAME
            # }

            # env {
            #     name  = "DOCKER_REGISTRY_SERVER_PASSWORD"
            #     value = var.DOCKER_REGISTRY_SERVER_PASSWORD
            # }
        }
    }

   # registry {
   #     server = var.ContainerRegistry_loginServer
   #     identity = "UserAssigned" 
   # }

    ingress {
        external_enabled  = true
        target_port       = 80
        transport         = "auto"
        traffic_weight {
            percentage      = 100
            latest_revision = true
        }
    }

    tags = {
        environment = var.environment
    }
}
