#Variables declaration

#Authentication
terraform {
  backend "azurerm" {
  }
  required_version = "0.12.1"
}

provider "azurerm" {
  version = "1.29.0"
}

provider "random" {
  version = "2.1.2"
}

variable "subscription_id" {
  description = "Azure subscription Id."
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant Id."
  type        = string
}

variable "service_principals" {
  type        = list
  description = "Azure service principals list containing the following keys : Application_Name, Application_Id, Application_Secret, Application_object_id."
}

#Common
variable "app_name" {
  description = "Application name used in objects naming convention."
  type        = string
}

variable "env_name" {
  description = "Environment name used in objects naming convention."
  type        = string
}

variable "default_tags" {
  type        = map(string)
  description = "Tag map that will be pushed on all Azure resources."
}

variable "rg_apps_name" {
  description = "Apps resource group name."
  type        = string
}

variable "rg_infr_name" {
  description = "infra resource group name."
  type        = string
}

variable "sa_infr_name" {
  description = "Infra storage account name."
  type        = string
}

variable "bck_rsv_name" {
  description = "Infra recovery services vault name."
  type        = string
}

#Subnet & Network Security group

variable "apps_snets" {
  type        = list
  description = "Subnet list."
}

variable "apps_nsgs" {
  type        = list
  description = "Apps Network Security Groups list containing the following keys : suffix_name."
}

#Load Balancers & Availability Set & Virtual Machines
variable "Lb_sku" {
  description = "The SKU of the Azure Load Balancer. Accepted values are Basic and Standard. Defaults to Basic."
  type        = string
}

variable "Lbs" {
  type        = list
  description = "Load Balancer list containing the following keys : suffix_name, Id_Subnet, static_ip."
}

variable "LbRules" {
  type        = list
  description = "Load Balancer rules list."
}

variable "Linux_Vms" {
  type        = list
  description = "Linux VM list"
}

variable "Linux_DataDisks" {
  type = list
}

variable "Linux_storage_image_reference" {
  type        = map(string)
  description = "Could containt an 'id' of a custom image or the following parameters for an Azure public 'image publisher','offer','sku', 'version'"
}

variable "Windows_Vms" {
  type        = list
  description = "Windows VM list"
}

variable "Windows_DataDisks" {
  type = list
}

variable "Windows_storage_image_reference" {
  type        = map(string)
  description = "Could containt an 'id' of a custom image or the following parameters for an Azure public 'image publisher','offer','sku', 'version'"
}

variable "Linux_Ss_Vms" {
  type        = list
  description = "Linux VM Scale Set list"
}

variable "Windows_Ss_Vms" {
  type        = list
  description = "Windows VM Scale Set list"
}

variable "app_admin" {
  description = "Specifies the name of the administrator account on the VM."
  type        = string
}

variable "pass" {
  description = "Specifies the password of the administrator account on the VM."
  type        = string
}

variable "ssh_key" {
  description = "Specifies the ssh public key to login on Linux VM."
  type        = string
}

variable "auto_sku" {
  description = "Specifies the automation account SKU."
  type        = string
}

variable "key_vaults" {
  description = "List containing your key vaults."
  type = list(object({
    suffix_name            = string
    policy1_tenant_id      = string
    policy1_object_id      = string
    policy1_application_id = string
  }))
}
