output "instance_ids" {
  description = "IDs de las instancias EC2 aprovisionadas"
  value       = aws_instance.notification_service[*].id
}

output "public_ips" {
  description = "Direcciones IP públicas de las instancias"
  value       = aws_instance.notification_service[*].public_ip
}

output "private_ips" {
  description = "Direcciones IP privadas de las instancias"
  value       = aws_instance.notification_service[*].private_ip
}

output "security_group_id" {
  description = "ID del grupo de seguridad asociado a las instancias"
  value       = aws_security_group.instance_sg.id
}

output "iam_instance_profile" {
  description = "Nombre del perfil de instancia IAM"
  value       = aws_iam_instance_profile.notification_profile.name
}