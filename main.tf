terraform {
  backend "s3" {
    region = "ap-northeast-1"
    # you can also define backend settings here.
    # bucket = "Bucket Name"
    # key    = "Key Name"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

provider "aws" {
  alias  = "cf"
  region = "${ var.region }"
}

module "waf" {
  source = "./waf"

  region               = "${ var.region }"
  prefix               = "${ var.prefix }"
  allow_cidr_blocks    = ["${ var.allow_cidr_blocks }"]
}

output "acl_id" {
  value = "${ module.waf.allow_ip_acl_id }"
}
