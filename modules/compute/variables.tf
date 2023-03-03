variable "enviroments" {}
variable "vpc-id" {}
variable "availability_zone" {}
variable "public-subnets-ids" {}
variable "sg-for_basic_server-id" {}
variable "ec2-config" {
      type = map(string)
      default = {
          image = ""
          machine_type = ""
          access_keypair = ""
          block_device_type = ""
          block_device_size = ""
      }
  }