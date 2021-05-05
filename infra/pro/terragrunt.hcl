locals {
	common_vars		=	read_terragrunt_config("vars.hcl")

	lb_vip			=	local.common_vars.locals.lb_vip
	lb_ips			=	local.common_vars.locals.lb_ips
	lb_ram			=	local.common_vars.locals.lb_ram
	lb_cpu			=	local.common_vars.locals.lb_cpu

	worker_ips		=	local.common_vars.locals.worker_ips
	worker_ram		=	local.common_vars.locals.worker_ram
	worker_cpu		=	local.common_vars.locals.worker_cpu
}

terraform {
	source = "${path_relative_from_include()}//resources"
}

include {
	path = find_in_parent_folders()
}

inputs = {

	lb_vip				=	"${local.lb_vip}"
	lb_ram				=	"${local.lb_ram}"
	lb_cpu				=	"${local.lb_cpu}"
	lb_ips				=	"${local.lb_ips}"

	worker_ram			=	"${local.worker_ram}"
	worker_cpu			=	"${local.worker_cpu}"
	worker_ips			=	"${local.worker_ips}"
}
