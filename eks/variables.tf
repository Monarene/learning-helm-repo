// Provided at runtime

variable "region" {
  type = string
  description = "us-east-2"
  default = "us-east-2"
}


variable "aws_profile" {
  type = string
  description = "AWS profile"
  default = "default"
}

variable "author" {
  type = string
  description = "Created by"
  default = "Monarene"
}

// Default values

variable "cluster_name" {
  type = string
  description = "EKS cluster name"
  default     = "test-helm"
}
