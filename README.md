<img src="./media/cafe.jpg" width="250" height="250">

# blue-circle
Coffee website content for Blue Circle

### Status
[![Build Status](https://travis-ci.org/amp5208/blue-circle.svg)](https://travis-ci.org/amp5208/blue-circle)

### Prerequisites
This product requires and assumes the use of the following technologies.  Installations for these
technologies are generally cross-platform and can be installed based on OS-specific installation
instructions.  Please setup the following:

 - Terraform
 - AWS Account with keys & AWS CLI
 - NodeJS & NPM
 - A Linux or MacOS

### Local Test / Build
This system orchestrates build and test using NPM script orchestration.  To install components:

```bash
npm install
```

To test and stage packages for AWS deployment, respectively:
```bash
npm run test
npm run serve
```

### Deployment
This system uses Terraform for AWS deployment orchestration.  To deploy:

```bash
./deploy.sh
# Then apply the subsequent plan, if appropriate:
terraform apply ".terraform/terraform.tfplan"
```

Terraform state is stored remotely.  Current / default configurations are for the upstream bucket.
To use in your own environment, please update the following line of Terraform with the correct
bucket detail:
 - [Remote State Location](https://github.com/amp5208/blue-circle/blob/8f4939a75ae9d5e8e3ca6a59c0917894eed6876e/terraform/web/main.tf#L3)
 - [AWS Account Number](https://github.com/amp5208/blue-circle/blob/8f4939a75ae9d5e8e3ca6a59c0917894eed6876e/terraform/web/variables.tf#L4)
