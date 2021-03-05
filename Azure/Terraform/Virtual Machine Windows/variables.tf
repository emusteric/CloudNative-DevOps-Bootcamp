variable "username" {
    description = "Username"
    type = string
    default = "benlocalaccount"
}

variable "securepassword" {
  description = "Secure Password"
  type = string
  sensitive = true
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
  default = "Ben-Test-RG"
}

variable "location" {
  description = "Region Location"
  type = string
  default = "australiasoutheast"
}

variable "vnet_name" {
  description = "VNET Name"
  type = string
  default = "Ben_Test_Network"
}

variable "address_space" {
  description = "Vnet Address Space"
  type = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of Subnet"
  type = string
  default = "Ben_Test_Subnet"
}

variable "subnet_address_range" {
  description = "Subnet Address Prefix"
  type =  list(string)
  default = ["10.0.1.0/24"]
}

variable "nic_name" {
  description = "Network Interface Name"
  type = string
  default = "ben_test_nic"
}

variable "nic_ipconfig_name" {
  description = "NIC IP Configuration Name"
  type = string
  default = "ben_test_nic_ipconfig"
}

variable "nic_ip_allocation_method" {
  description = "Static or Dynamic ip allocation method"
  type = string
  default = "Dynamic"
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type = string
  default = "bentestvm"
}

variable "vm_size" {
  description = "VM Size"
  type = string
  default = "Standard_B1s"
}

variable "os_disk_cache_type" {
  description = "OS Disk Cache Type"
  type = string
  default = "ReadWrite"
}

variable "os_storage_type" {
  description = "OS Storage Type"
  type = string
  default = "Standard_LRS"
}

variable "os_publisher" {
  description = "Publisher"
  type = string
  default = "MicrosoftWindowsServer"  
}

variable "os_offer" {
  description = "Type of OS"
  type = string
  default = "WindowsServer"
}

variable "os_sku" {
  description = "OS Version"
  type = string
  default = "2016-Datacenter"
}

variable "os_version" {
  description = "OS Version"
  type = string
  default = "latest"
}
