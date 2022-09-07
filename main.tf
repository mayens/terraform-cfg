# create the keypair
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "TF-key" {
    content  = tls_private_key.rsa.private_key_pem
    filename = "tfkey"
}

resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}



# Create an EC2 instance for Master

resource "aws_instance" "ec2-master-salomon" {
  ami			          = var.AMI_ID
  instance_type           = var.instance_type
  key_name = "${aws_key_pair.TF_key.key_name}" 
  vpc_security_group_ids  = ["${aws_security_group.instance_master.id}"]
  subnet_id                   = "${aws_subnet.subnet.id}"
  associate_public_ip_address = "${var.instance-associate-public-ip}"

  tags = {
    Name = "u-ctrl-salomon"
  }
  user_data = <<-EOF
	      #!/bin/bash
	       sudo apt-get update	
           sudo apt-get install -y ansible      
	      EOF
			  
 
}


# Create 3 EC2 instances for worker nodes

resource "aws_instance" "ec2-node-salves" {
  ami			          = var.AMI_ID
  instance_type           = var.instance_type
  key_name = "${aws_key_pair.TF_key.key_name}" 
  vpc_security_group_ids  = ["${aws_security_group.instance_ubuntu_slaves.id}"]
  subnet_id                   = "${aws_subnet.subnet.id}"
  associate_public_ip_address = "${var.instance-associate-public-ip}"

  count=3

  tags = {
    Name = "u-web-salomon-${count.index}"
  }
  user_data = <<-EOF
	      #!/bin/bash
	       sudo apt-get update	                
	      EOF
			  
 
}





