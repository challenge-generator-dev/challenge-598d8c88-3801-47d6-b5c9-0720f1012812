environment_name = "dev"

vpc_id           = "vpc-xxxxxxxx"
subnet_ids       = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]

instance_type    = "t3.small"
instance_count   = 2

ami_id           = "ami-0c55b159cbfafe1f0"

key_name         = "dev-notifications-key"

user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              systemctl start docker
              systemctl enable docker
              docker run -d --name notifications -p 8080:8080 notifications:latest
              EOF

security_groups = ["sg-xxxxxxxx"]

tags = {
  Environment = "development"
  Project     = "notification-service"
  ManagedBy   = "terraform"
  CostCenter  = "dev-team"
}