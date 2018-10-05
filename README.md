# waf_ip_restriction

Create Ip Restriction with waf

## commands

```
terraform get
terraform init -backend-config="bucket=<Bucket Name>" -backend-config="key=<Key Name>"
terraform plan --var-file=<Varfile Name>
```

## Sample: Using as module 

Create main.tf like this and write variable to your .tfvars

```
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

variable "region" {}

variable "prefix" {}

variable "allow_cidr_blocks" {
  type = "list"
}

module "waf" {
  source = "git@github.com:heleeen/waf_ip_restriction"

  region               = "${ var.region }"
  prefix               = "${ var.prefix }"
  allow_cidr_blocks    = ["${ var.allow_cidr_blocks }"]
}

output "acl_id" {
  value = "${ module.waf.acl_id }"
}

```
