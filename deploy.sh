#!/bin/bash -e

if [ $(whoami) != "root" ]; then
  source ~/.bash_profile
fi

npm test
if [[ -d ./terraform ]]; then
  echo 'Already initialized terraform.'
else
  terraform init ./terraform/web
fi

terraform fmt -write=true -diff=true -list=true

terraform plan -out .terraform/terraform.tfplan ./terraform/web/
