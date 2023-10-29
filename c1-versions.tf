terraform {
    required_version = "~> 1.6.2" ## Only rightmost value is allowd to change i.e. script will run for 1.6.x but not for <= 1.7
    required_providers {
      ## Below is the local name of the provider. This should be unique for the module and proved will be referenced with this name throught the module
      aws = {
        source = "harshicorp/aws" # The name after the "/" is called the prefered name of the provider
        version = "~> 5.12.0"
      }
    }
}

# Declaring the provider block with the label as the local name of the provider
provider "aws" {
  region = "ap-south-1"
  profile = "default" ##Authentication Credentials will be automatically picked form aws home.
}

#Resource <TYPE>    <Local Name> ## The combination of resouce type and local name should be unique in a module.
resource "aws_instance" "terraform-test-ec2" {
   ami="" 
   user_data = file("${path.module}/user-data.sh")
   instance_type="t4g.micro"
   tags = {
    Name = "terraform-test-ec2"
   }
}