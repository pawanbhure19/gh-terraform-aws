//write the code or security group here
    
    variable "region" {
        description = "The AWS region to deploy resources in"
        type        = string
        default     = "us-east-1"
      
    }
    provider "aws" {
        region = var.region
    }

    terraform {
        backend "s3" {
            bucket = "my-terraform-state-bucket-exist" 
            key    = "terraform.tfstate"
            region = "us-east-1"
        }
    } 



    resource "aws_security_group" "example" {
        name        = "example"
        description = "Example security group"

        ingress {
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }

        egress {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
