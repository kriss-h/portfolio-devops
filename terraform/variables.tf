variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "portfolio-rg"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
  default     = "portfolioacr2023kh"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "portfolio-plan"
}

variable "app_service_name" {
  description = "Name of the App Service"
  type        = string
  default     = "portfolio-kh2023"
}

variable "docker_image_name" {
  description = "Name of the Docker image"
  type        = string
  default     = "portfolio-website:latest"
}
