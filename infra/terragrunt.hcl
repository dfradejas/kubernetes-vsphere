locals {
 common_vars = read_terragrunt_config("credentials.hcl")
 
 user = local.common_vars.locals.user
 password = local.common_vars.locals.password
 server = local.common_vars.locals.server
}

generate "provider" {
	path = "provider.tf"
	if_exists = "overwrite_terragrunt"
	contents = <<EOF
provider "vsphere" {
  user				=	"${local.user}"
  password			=	"${local.password}"
  vsphere_server	=	"${local.server}"
  
  # If you have a self-signed cert
  allow_unverified_ssl = true
}
EOF
}