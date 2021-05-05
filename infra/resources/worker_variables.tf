variable "worker_ram" {
  description = "RAM de los workers en MB"
  type = number
  default = 0
}
variable "worker_cpu" {
  description = "CPU de los workers en cores"
  type = number
  default = 0
}
variable "worker_ips" {
  description = "IPs de los workers"
  type = list(string)
  default = null
}
