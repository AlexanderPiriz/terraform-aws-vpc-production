# AWS VPC Deployment with Terraform (Production-Style Architecture)

## Overview
This project provisions a production-style AWS VPC using Terraform, following best practices for modular design, security, scalability, and operational reliability. It includes public and private subnets, routing, NAT gateway, EC2 instances, security groups, remote state management, and CloudWatch monitoring.

The goal of this project is to demonstrate real-world cloud engineering skills including:
- Infrastructure-as-Code (IaC)
- AWS networking fundamentals
- Secure architecture design
- Terraform module structure
- Monitoring and operational readiness

---

## Architecture Diagram (Description)
The architecture consists of:

- **VPC (10.0.0.0/16)**  
- **Public Subnets (x2)**  
  - Internet Gateway  
  - Route table with 0.0.0.0/0 → IGW  
  - Bastion host (optional)
- **Private Subnets (x2)**  
  - NAT Gateway in public subnet  
  - Route table with 0.0.0.0/0 → NAT  
  - EC2 application instances
- **Security Groups**  
  - Bastion SG (SSH from your IP only)  
  - App SG (allow only required ports)  
- **Remote State**  
  - S3 bucket for state  
  - DynamoDB table for state locking  
- **Monitoring**  
  - CloudWatch metrics  
  - CloudWatch alarms  
  - SNS notifications (optional)

This mirrors a standard production VPC used in real AWS environments.

---

## Repository Structure

