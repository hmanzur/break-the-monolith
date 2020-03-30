#Availability zones
variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  default     = "break-the-monolith"
}
