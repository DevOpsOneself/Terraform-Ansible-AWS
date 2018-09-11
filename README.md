AWS-ANSIBLE
====
# Terraform
```
cd Terraform-build<br/>
terraform plan --var-file=terraform.tfvars<br/>
terraform apply --var-file=terraform.tfvars<br/>
```

# Ansible<br/>
```
cd Ansible-build<br/>
TF_STATE=../Terraform-build/terraform.tfstate ansible-playbook --inventory-file=/usr/local/bin/terraform-inventory WSO2EI.yml<br/>
```
