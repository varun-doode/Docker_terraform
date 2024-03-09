provider "aws" {
  region     = "us-east-2"
  access_key = "AKIA6K5GLNNQSKSEHHGB"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
    ami = "ami-0f5daaa3a7fb3378b"
    instance_type = "t2.micro"
}
