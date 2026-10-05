# Configuration Management with Ansible on AWS

## Services Used 🛠
* **Terraform** – Infrastructure as Code  
* **Amazon EC2** – Virtual servers  
* **Amazon VPC** – Networking and security  
* **AWS Security Groups** – Network access control  
* **Ansible** – Configuration management  
* **AWS IAM** – Authentication and permissions  

---

## 📸 Project Overview
### Scenario
A growing SaaS company, CloudNova, is expanding its backend infrastructure to support multiple internal services. As the number of servers increases, the engineering team starts facing serious operational issues.

Today, their EC2-based backend servers are:

* Configured manually after launch  
* Set up slightly differently by each engineer  
* Difficult to keep consistent across environments  
* Error-prone during updates and maintenance
<br>
As the company scales, this approach becomes unreliable and unmanageable. A small configuration mismatch can cause outages, security gaps, or deployment failures.
<br>
To solve this, the team decides to adopt configuration management using Ansible, ensuring that every server is configured the same way, every time, using code.

---
## Role as a DevOps Engineer
My role is to design and build AWS infrastructure entirely using Terraform, following real-world DevOps best practices.  

I am responsible for:  
* Writing Terraform code to provision AWS resources  
* Managing infrastructure state safely using a remote backend  
* Building infrastructure incrementally instead of all at once  
* Refactoring Terraform code into reusable modules  
*  Understanding how Terraform tracks, plans, and applies changes  
<br>
This mirrors how DevOps engineers manage infrastructure in production teams.

---
## Solution
To deploy a containerized backend service on Amazon EKS and let Kubernetes manage it.  
<br>
The solution includes:  
* A Dockerized application stored in Amazon ECR
* An Amazon EKS cluster with EC2 worker nodes
* A Kubernetes Deployment to run and manage Pods
* A Kubernetes Service (NodePort) to expose the application
* Health endpoints to verify application status
<br> 
The focus of this project is on Kubernetes fundamentals, not production optimizations.
---

## ✨ Architectural Diagram

![Architectural Diagram](https://github.com/Botskiss/terraform-aws-iac/blob/main/twl-aws-iac-diagram.png)


---
## Final Result
At the end of the project, I have:  
* Built a complete AWS environment without using the AWS Console
* Stored Terraform state securely using S3 and DynamoDB
* Organized infrastructure using reusable modules
* Deployed a working web application
* Cleaned up everything safely using Terraform
  <br>
  <br>
This project reflects how real DevOps teams build, manage, and maintain cloud infrastructure at scale.

<br> 
<br>

![Final Result](https://github.com/Botskiss/terraform-aws-iac/blob/main/terraform-aws-iac-final.png)

