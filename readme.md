terraform-aws-vpc-production

A production‑ready, multi‑module Terraform project that provisions a secure, scalable AWS network foundation. The architecture includes a VPC, multi‑AZ subnets, routing, EC2 compute, security controls, and CloudWatch monitoring — structured to reflect real‑world cloud engineering practices.

Architecture Overview
This project builds a foundational AWS environment suitable for staging or production workloads.

VPC (Production‑grade)
- Custom CIDR block
- DNS hostnames + DNS support enabled
- Isolated routing structure for public/private separation

Public & Private Subnets
- Multi‑AZ high availability
- Public subnets for ingress and internet‑facing components
- Private subnets for backend workloads and future expansion

Internet Gateway & Route Tables
- Public route tables with IGW
- Private route tables prepared for NAT Gateway integration

Security Groups
- Modular SG definitions
- Least‑privilege ingress/egress rules
- Reusable patterns for EC2 and future services

EC2 Instance (Amazon Linux 2)
- AMI sourced dynamically via SSM Parameter Store
- Ensures always‑valid, up‑to‑date Amazon Linux 2 images
- Deployed into a public subnet

Tagged for environment identification

CloudWatch Alarms + SNS Notifications
- CPU utilization alarm
- SNS topic for alerting
- Ready for email/SMS integration

Repository Structure
Code
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
Each module is isolated, reusable, and follows Terraform best practices for maintainability and scalability.

EC2 AMI Handling (SSM Parameter Store)
This project uses AWS’s official SSM parameter:

Code
/aws/service/ami-amazon-linux-latest/amzn2-ami-kernel-default-hvm-x86_64-gp2

This approach ensures:

- No hard‑coded AMI IDs

- No AMI expiration or deprecation issues

- Always‑current Amazon Linux 2 images

- Cleaner, more maintainable Terraform code

Future Enhancements
This repository is designed for incremental expansion. Planned improvements include:

- NAT Gateway for private subnet outbound access

- Application Load Balancer + Target Groups

- Auto Scaling Group

- S3 + IAM roles for workload access

- CloudWatch Agent + log streaming

- GitHub Actions CI/CD pipeline

- Pre‑commit hooks (fmt, validate, tflint)
