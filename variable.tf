
variable "AMI_ID" {
  default = "ami-065deacbcaac64cf2"
}

variable "instance_type" {
  type = string
  description = "type instance"
  default = "t2.micro"
}
variable "availability_zone" {
  type = string
  description = "zone la region"
  default = "eu-central-1a"
}
# variable "var_tag" {
#   type = string
# }

variable "ec2_name_slave" {
  type = string
  default = "u-web-salomon"
}

variable "my_user_data" {
  type = string
  default =  <<-EOF
        #!/bin/bash
        sudo apt-get update
        EOF
}

variable "instance-associate-public-ip" {
  description = "Defines if the EC2 instance has a public IP address."
  type        = string
  default     = "true"
}

variable "vpc-cidr-block" {
  description = "The CIDR block to associate to the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet-cidr-block" {
  description = "The CIDR block to associate to the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "vpc-tag-name" {
  description = "The Name to apply to the VPC"
  type        = string
  default     = "VPC-created-by-salomon"
}

variable "ig-tag-name" {
  description = "The name to apply to the Internet gateway tag"
  type        = string
  default     = "aws-ig-created-by-salomon"
}

variable "subnet-tag-name" {
  description = "The Name to apply to the VPN"
  type        = string
  default     = "VPN-created-by-salomon"
}

variable "sg-master-tag-name" {
  description = "The Name to apply to the security group for master"
  type        = string
  default     = "SG-master-created-by-salomon"
}


variable "sg-slave-tag-name" {
  description = "The Name to apply to the security group for worker nodes"
  type        = string
  default     = "SG-slave-created-by-salomon"
}