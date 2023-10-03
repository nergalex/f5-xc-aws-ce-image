output "ce" {
  value = {
#    id          = aws_instance.instance.id
#    ami         = aws_instance.instance.ami
#    name        = aws_instance.instance.tags["Name"]
#    tags        = aws_instance.instance.tags
#    public_ip   = aws_instance.instance.public_ip
#    private_ip  = aws_instance.instance.private_ip
#    private_dns = aws_instance.instance.private_dns
#    user_data_base64 = aws_instance.instance.user_data_base64
    user_data_base64     = base64encode(var.f5xc_instance_config)
  }
}
