# Master Server details
output "master_instance_ip" {
  description = "Public Ip of Instance"
  value = aws_instance.AppServer.public_ip
}

output "master_instance_ip_url" {
  description = "Public Url of Instance"
  value = "http://${aws_instance.AppServer.public_ip}:8080"
}

output "copy_master_jenkins_password" {
  description = "Command to get Jenkins Password file"
  value       = <<EOT
ssh -i terra_key ubuntu@${aws_instance.AppServer.public_ip} "sudo cat /var/lib/jenkins/secrets/initialAdminPassword" > master_jenkins_password.txt
EOT

}

output "SSH_connect_master" {
  description = "Command to connect server"
  value = "ssh -i terra_key ubuntu@${aws_instance.AppServer.public_ip}"  
}

# Worker Server details

output "worker_instance_ip" {
  description = "Public Ip of Instance"
  value = aws_instance.AppServer2.public_ip
}

output "worker_instance_ip_url" {
  description = "Public Url of Instance"
  value = "http://${aws_instance.AppServer2.public_ip}:8080"
}

output "copy_worker_jenkins_password" {
  description = "Command to get Jenkins Password file"
  value       = <<EOT
ssh -i terra_key ubuntu@${aws_instance.AppServer2.public_ip} "sudo cat /var/lib/jenkins/secrets/initialAdminPassword" > worker_jenkins_password.txt
EOT

}

output "SSH_connect_worker" {
  description = "Command to connect server"
  value = "ssh -i terra_key ubuntu@${aws_instance.AppServer2.public_ip}"  
} 