#Availability zones
variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  default     = "break-the-monolith"
}

variable "availability_zones" {
  description = "Availability zones"
  default     = "us-east-1a"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.0.0.0/16"
}

variable "public2_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.0.3.0/24"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.0.1.0/24"
}

variable "private2_subnet_cidr" {
  description = "CIDR for private subnet"
  default     = "10.0.4.0/24"
}

variable "ops2_subnet_cidr" {
  description = "CIDR for ops subnet"
  default     = "10.0.7.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  default     = "10.0.2.0/24"
}

variable "ops_subnet_cidr" {
  description = "CIDR for ops subnet"
  default     = "10.0.6.0/24"
}

