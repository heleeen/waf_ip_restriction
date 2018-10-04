resource "aws_waf_web_acl" "allow-ip-acl" {
  name        = "${ var.prefix }-allow-ip-acl"
  metric_name = "IpAllowWafAcl"

  default_action {
    type = "BLOCK"
  }

  rules {
    action {
      type = "ALLOW"
    }

    priority = 1
    rule_id  = "${ aws_waf_rule.allow_ip_address_rule.id }"
  }
}

output "allow_ip_acl_id" {
  value = "${ aws_waf_web_acl.allow-ip-acl.id }"
}
