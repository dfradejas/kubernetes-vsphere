data "vsphere_datacenter" "dc" {
  name = "LAB-GMV"
}

data "vsphere_datastore" "datastore" {
  name			=	"arcon-ds"
  datacenter_id	=	"${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name			= "192.168.111.42/Resources"
  datacenter_id	= "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name			= "Lab_ext2"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name			= "TEMPLATES/[TEMPLATE] Ubuntu Server 20.4 - NO BORRAR"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_folder" "folder" {
  path			= "SECDEVOPS"
  type			= "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}