/*aws-vpc-settings*/
variable "enviroments" {}
variable "vpc-cidr" {
  type        = string
  default     = ""
}
variable "availability_zone" {}
variable "public-subnets" {
  type        = string
  default     = ""
}
