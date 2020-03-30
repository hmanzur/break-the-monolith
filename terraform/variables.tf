variable "region" {
  description = "ECS region"
  default     = "us-east-1"
}

#Availability zones
variable "availability_zones" {
  description = "Availability zones"
  default     = []
}
