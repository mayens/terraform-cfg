# Terraform AWS for EC2 instances and VPC
Automatic deployment and management of EC2 instances using Terraform.

The stack created by this terraform script is composed of:
  * Compute
    * 4 EC2 instances (1 master instance and 3 worker nodes)
  * Network
    * Virtual Private Cloud
    * Internet Gateway
    * Security Group
    * Route table
    * Subnet

We can only ssh worker nodes directly from the master

# Prerequisites
- Install Terraform: [Terraform download](https://www.terraform.io/downloads)

# How to use

- Set AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY, environment variables

```
$ export AWS_ACCESS_KEY_ID="YOUR ACCESS KEY ID"
$ export AWS_SECRET_ACCESS_KEY="YOUR SECRET ACCESS KEY"
```

## Run
Run the following command to create your resources

## Run Terraform Init
```shell
terraform init
```

## Run Terraform Plan
```shell
terraform plan
```

## Run Terraform apply
```shell
terraform apply
```

## Authors

* **Salomon Mayengue**