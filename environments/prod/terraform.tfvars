environment_name = "prod"

vpc_id           = "vpc-yyyyyyyy"
subnet_ids       = ["subnet-zzzzzzzz", "subnet-aaaaaaaa"]

instance_type    = "t3.medium"
instance_count   = 4

ami_id           = "ami-0c55b159cbfafe1f0"

key_name         = "prod-notifications-key"

user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker docker-compose
              systemctl start docker
              systemctl enable docker
              curl -s https://raw.githubusercontent.com/containers/podman/main/contrib/podmanimage/stable/Containerfile | podman build -t notifications:latest .
              podman run -d --name notifications --restart=always -p 8080:8080 notifications:latest
              EOF

security_groups = ["sg-yyyyyyyy"]

tags = {
  Environment = "production"
  Project     = "notification-service"
  ManagedBy   = "terraform"
  CostCenter  = "core-services"
  Compliance  = "pci-dss"
}