variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "myTFVNet"
  
}

variable "vnet_address_space" {
  description = "The address space that is used by the virtual network"
  type        = string
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "myTFSubnet"
}

variable "subnet_address_prefix" {
  description = "The address prefix that is used by the subnet"
  type        = string
  default     = "10.0.1.0/24"
}