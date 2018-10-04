region = "us-east-1"

prefix = "sample-hel"

# terraformにはloopする術がないんだ
# set ips which allow to access
allow_cidr_blocks = [
  {
    type  = "IPV4"
    value = "0.0.0.0/24",
  }
]
