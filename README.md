# K8S Cluster en VSphere Vmware

## Alcance
Este repositorio se encarga de desplegar la infraestructura y los servicios del cluster de Kubernetes dedicado para SecDevOps.

## Arquitectura
* Una virtual IP
* Dos balanceadores (lb1 y lb2)
* Tres nodos controller, etcd y workers

## Requisitos
* Terragrunt v0.28.24
* Terraform v0.14.8
* Ansible 2.10.8
* sshpass
* Fichero infra/pro/credentials.hcl. Copiar de credentials.hcl.example y añadir las credenciales correctas
* Contraseña del vault de ansible y de las máquinas virtuales dentro del vault (está por defecto)

## Procedimiento
### Despliegue
* ```cd infra/pro; terragrunt init; terragrunt plan; terragrunt apply```
* ```cd servicios; export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i inventario sites.yml --ask-vault-pass```

### Borrado
* ```cd infra/pro; terragrunt destroy``` (Igual se necesita ejecutar dos veces para borrar también la carpeta)
