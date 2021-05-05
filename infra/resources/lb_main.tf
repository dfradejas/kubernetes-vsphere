resource "vsphere_virtual_machine" "lb1" {
  name				= "[SECDEVOPS] secdevops_k8s_lb1 ${var.lb_ips[0]} [DFJP]"
  folder			= "SECDEVOPS"
  resource_pool_id	= "${data.vsphere_resource_pool.pool.id}"
  datastore_id		= "${data.vsphere_datastore.datastore.id}"

  num_cpus = var.lb_cpu
  memory   = var.lb_ram
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "lb1"
        domain    = "internal"
      }

      network_interface {
        ipv4_address = var.lb_ips[0]
        ipv4_netmask = 21
      }

      ipv4_gateway = "192.168.207.254"
    }
  }
}

resource "vsphere_virtual_machine" "lb2" {
  name				= "[SECDEVOPS] secdevops_k8s_lb2 ${var.lb_ips[1]} [DFJP]"
  folder			= "SECDEVOPS"
  resource_pool_id	= "${data.vsphere_resource_pool.pool.id}"
  datastore_id		= "${data.vsphere_datastore.datastore.id}"

  num_cpus = var.lb_cpu
  memory   = var.lb_ram
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "lb2"
        domain    = "internal"
      }

      network_interface {
        ipv4_address = var.lb_ips[1]
        ipv4_netmask = 21
      }

      ipv4_gateway = "192.168.207.254"
    }
  }
}