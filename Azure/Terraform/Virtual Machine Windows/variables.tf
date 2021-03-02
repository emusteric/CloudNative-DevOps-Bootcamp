variable "username" {
    description = "Secure Username"
    type = string
    default = "Admin"
}

variable "securepassword" {
  description = "Secure Password"
  type = string
  sensitive = true
}

