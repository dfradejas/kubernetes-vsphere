locals {

	# Levanta un balanceador. Indicar la IP y recrusos que se quiere que tenga el balanceador
	lb_vip			=	"192.168.200.231"
	lb_ips			=	["192.168.200.232","192.168.200.233"]
	lb_ram			=	1024 # En Mb
	lb_cpu			=	1

	# Despliega 3 workers. Indicar las IPs y recrusos que quiere que se tenga cada worker
	worker_ips		=	["192.168.200.234","192.168.200.235","192.168.200.236"]
	worker_ram		=	8192
	worker_cpu		=	4
}