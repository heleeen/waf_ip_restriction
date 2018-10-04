resource "aws_waf_ipset" "allow_ipset" {
  name = "${ var.prefix }-allow-ipset"

  ip_set_descriptors = "${ var.allow_cidr_blocks }"
}
