/*provider-settings*/
variable "aws_access_key" {}
variable "aws_secret_key" {}

/*provider-select-region*/
variable "aws_region" {
  default = "ap-northeast-1"
}

/*aws-vpc-settings*/
variable "enviroments" {
  default     = "bot-server"
}
variable "vpc-cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zone" {
  default     = "ap-northeast-1a"
}


variable "public-subnets" {
  type        = string
  default     = "10.0.0.0/24"
}

/*aws-ec2-settings*/
variable "ec2-config" {
      type = map(string)
      default = {
          image = "ami-0ff21806645c5e492"
          machine_type = "t2.micro"
          access_keypair = "terraform_20221207"
          block_device_type = "gp2"
          block_device_size = "8"
      }
  }