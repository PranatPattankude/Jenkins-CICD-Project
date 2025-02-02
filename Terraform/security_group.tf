resource "aws_security_group" "security" {
  vpc_id = aws_vpc.AppVPC.id

  dynamic "ingress" {
    for_each = var.ingress_port
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [var.sg_cidr[0]]
    }
  }

  dynamic "egress" {
    for_each = var.egress_port
    content {
      from_port = egress.value
      to_port = egress.value
      protocol = "-1"
      cidr_blocks = [var.sg_cidr[0]]
    }
  }
  tags = {
    Name= "Master Security"
  }
}

resource "aws_security_group" "work_security" {
  vpc_id = aws_vpc.AppVPC.id

  dynamic "ingress" {
    for_each = var.ingress_port2
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [var.sg2_cidr[0]]
    }
  }

  dynamic "egress" {
    for_each = var.egress_port2
    content {
      from_port = egress.value
      to_port = egress.value
      protocol = "-1"
      cidr_blocks = [var.sg2_cidr[0]]
    }
  }
  tags = {
    Name= "Worker Security"
  }
}