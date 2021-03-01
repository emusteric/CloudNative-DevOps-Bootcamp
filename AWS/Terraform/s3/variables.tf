variable "bucket_name" {
  type = string
  description = "Name of the Bucket"
  default = "bentest150719856"
}

variable "acl" {
  type = string
  description = "Public, Private or a Mix"
  default = "private"
}

variable "location" {
  type = string
  description = "Location"
  default = "us-east-1"
}