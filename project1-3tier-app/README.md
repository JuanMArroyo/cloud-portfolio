# 🏗️ Project 1 — Three‑Tier Web Application on AWS (Terraform)

## Overview
This project deploys a production‑style **three‑tier architecture** on AWS using **modular Terraform**.  
It includes networking, security, compute, load balancing, and database layers — all automated through Infrastructure‑as‑Code.

---

## Architecture Summary
| Layer | Description | Purpose |
|-------|--------------|----------|
| **VPC** | Custom Virtual Private Cloud with DNS enabled | Isolated network foundation for all resources |
| **Internet Gateway** | Attached to VPC | Enables public access for ALB and outbound traffic |
| **Subnets** | 6 total (2 public, 2 private app, 2 private DB) | Separates tiers and provides multi‑AZ redundancy |
| **Route Tables** | Public routes to IGW, private routes internal only | Controls traffic flow between tiers |
| **Security Groups** | ALB, EC2, and RDS firewalls | Enforces least‑privilege access between layers |
| **ALB** | Application Load Balancer | Public entry point, distributes traffic to EC2 |
| **EC2** | Application tier | Hosts app logic, connects to ALB and RDS |
| **RDS** | Database tier | Private managed database, accessible only by EC2 |
| **S3** | Log storage | Stores ALB access logs for monitoring |

---

## Terraform Implementation
- Modular design (`/modules/vpc`, `/modules/subnets`, `/modules/alb`, etc.)
- Variables for flexible configuration
- Outputs for ALB DNS, RDS endpoint, VPC ID, and subnet IDs
- Secure, reusable, and scalable IaC structure

---

## Outputs
After deployment, Terraform returns:
- **ALB DNS Name** → Public app endpoint  
- **Target Group ARN** → For scaling or ECS integration  
- **RDS Endpoint** → Private database connection  
- **VPC/Subnet IDs** → For future expansion  

---

## Result
✅ Successfully deployed a secure, multi‑AZ, three‑tier AWS environment using Terraform.  
Demonstrates cloud architecture design, modular IaC, and real‑world troubleshooting skills.

---

## Author
**Juan M. Arroyo**  
Aspiring IT Support & Cloud Engineer | Worcester, MA  

