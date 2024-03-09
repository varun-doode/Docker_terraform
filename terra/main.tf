provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAZI2LCCXHETG7TJWR"
  secret_key = "CJpnTegnRuEfYpivbDyFpfLrkZPZHQghLBu06pI/"
}

resource "aws_instance" "example" {
  ami           = "ami-0f5daaa3a7fb3378b" 
  instance_type = "t2.micro"  

  tags = {
    Name = "assignment_instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apt-transport-https ca-certificates curl software-properties-common
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
              add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
              apt-get update
              apt-get install -y docker-ce docker-ce-cli containerd.io
              EOF
}

