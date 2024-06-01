## Pre-Requisites
1. AWS Account
2. AWS CLI Configuration
3. Terraform Installation

## AWS CLI Configuration
- Go to [Install](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
  # Windows
  > msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi

## Installation
- Go to [Install](https://developer.hashicorp.com/terraform/install)
- Download and extract
- Add the path to environment variables

## Cloning
Clone the repo and give the commands sequentially.

## Commands
```
terraform init
terraform plan
terraform apply
```

Deployed static webpage by creating **AWS S3 Bucket** using **Terraform**

This project was implemented using [Terraform Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket.html)
