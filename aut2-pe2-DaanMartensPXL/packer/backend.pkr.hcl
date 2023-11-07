packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = "~> 1"
    }
  }
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "source_ami" {
  type    = string
  default = "ami-0e8a34246278c21e4"
}

variable "instance_type" {
  type    = string
  default = "t2.medium"
}

variable "ssh_username" {
  type    = string
  default = "ec2-user"
}

variable "s3_bucket_name" {
  type = string
  default = ""
}

source "amazon-ebs" "backend" {
  region        = var.region
  source_ami    = var.source_ami
  instance_type = var.instance_type
  ssh_username  = var.ssh_username
  ami_name = "backend-todo-app-${replace(timestamp(), ":", "-")}"
}

build {
  sources = [
  "source.amazon-ebs.backend"
  ]

  provisioner "ansible" {
    playbook_file = "./ansible/backend.yaml"
    user = "ec2-user"
    extra_arguments = [
        "-e", "s3_bucket_name=${var.s3_bucket_name}",
        "-v"
      ]
  }
}
