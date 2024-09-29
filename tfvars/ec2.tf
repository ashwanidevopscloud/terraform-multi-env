resource "aws_instance" "expense"{
    for_each = var.instances
    ami="ami-09c813fb71547fc4f"
    instance_type=each.value
    vpc_security_group_ids = [  aws_security_group.sg.id]
    
    tags=merge(
        var.common_tags,
        var.tags,
        
        {
        Name=each.key
    })
}
resource "aws_security_group" "sg"{
    name="terraform-${var.environment}"
    description = "it allow port number 22 for ssh access"
    ingress {
        from_port =22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
        ipv6_cidr_blocks=["::/0"]
    }
    egress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
        ipv6_cidr_blocks=["::/0"]
    }
    tags=merge(var.common_tags,var.tags,
    {
        Name="sg-${var.environment}"
    })
}