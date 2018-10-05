resource "aws_waf_rule" "allow_ip_address_rule" {
  name        = "${ var.prefix }-allow-ip-address-rule"
  metric_name = "AllowIpRule"

  predicates {
    data_id = "${ aws_waf_ipset.allow_ipset.id }"
    negated = false
    type    = "IPMatch"
  }
}
