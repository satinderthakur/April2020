resource "aws_instance" "traning_instance"  {
  ami        = var.amis
  instance_type = var.instance_type

# the public SSH key
key_name = aws_key_pair.mykeypair.key_name

tags = {
 Name = "training_instance"
}

 user_data = <<-EOF
             #!/bin/bash
             yum update -y
             yum install httpd -y
             echo "Terraform with AWS Training!" > /var/www/html/index.html
             service httpd start
             service httpd on
             EOF

 provisioner "file" {
   source = "script.sh"
   destination = "/tmp/script.sh"
 }
 provisioner "remote-exec" {
   inline = [
     "chmod +x /tmp/script.sh",
     "sudo /tmp/script.sh"
   ]
  }
}  