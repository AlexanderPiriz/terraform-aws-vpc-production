terraform-aws-vpc-production
A production‑ready, multi‑module Terraform project that builds a secure, scalable AWS network foundation with EC2 compute, CloudWatch monitoring, and modular infrastructure structure suitable for real‑world deployments.

Architecture Overview
This project provisions:

VPC (Production‑grade)

Custom CIDR

DNS hostnames + DNS support

Isolated routing structure

Public & Private Subnets

High‑availability (multi‑AZ)

Public subnets for ingress

Private subnets for backend workloads

Internet Gateway & Route Tables

Public route tables with IGW

Private route tables (future NAT support)

Security Groups

Modular SG definitions

Ingress/egress rules for EC2

EC2 Instance (Amazon Linux 2)

AMI sourced via SSM Parameter Store (always up‑to‑date)

Public subnet deployment

SG attachment

Tags for environment identification

CloudWatch Alarms + SNS Notifications

CPU utilization alarm

SNS topic for alerting

Ready for integration with email/SMS

Repository Structure
terraform-aws-vpc-production/
│
├── main.tf
├── variables.tf
├── outputs.tf
│
├── modules/
│   ├── vpc/
│   ├── subnets/
│   ├── security-groups/
│   ├── ec2/
│   └── cloudwatch/
│
└── .gitignore
Each module is isolated, reusable, and follows Terraform best practices.

EC2 AMI Handling (SSM Parameter Store)
This project uses AWS’s official SSM parameter:
/aws/service/ami-amazon-linux-latest/amzn2-ami-kernel-default-hvm-x86_64-gp2

This ensures:

* No hard‑coded AMI IDs

* No AMI expiration issues

* Always‑valid Amazon Linux 2 images

Future Enhancements
* NAT Gateway for private subnet outbound access

* Application Load Balancer + Target Groups

* Auto Scaling Group

* S3 + IAM roles

* CloudWatch Agent + log streaming

* GitHub Actions CI/CD

* Pre‑commit hooks (fmt, validate, tflint)
