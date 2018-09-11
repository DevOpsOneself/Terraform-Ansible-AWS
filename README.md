AWS-ANSIBLE
====
# Terraform
## AWS security info: 
```
vi Terraform-build/terraform.tfvars
access_key = ""
secret_key = ""
```
## Create Infrastructure
```
cd Terraform-build
terraform plan --var-file=terraform.tfvars
terraform apply --var-file=terraform.tfvars
```

# Ansible<br/>
## Install terraform-inventory<br/>
[terraform-inventory](https://github.com/adammck/terraform-inventory.git)<br/>
## Ansible playbook
```
cd Ansible-build
TF_STATE=../Terraform-build/terraform.tfstate ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory WSO2EI.yml
```
