variable "lb_ram" {
  description = "RAM del lb en MB"
  type = number
  default = 0
}
variable "lb_cpu" {
  description = "CPU del lb en cores"
  type = number
  default = 0
}
variable "lb_ips" {
  description = "IP de los LB"
  type = list(string)
  default = null
}
