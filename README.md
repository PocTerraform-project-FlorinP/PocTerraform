# PocTerraform

An Environment Based on a 3-Tier Architecture
Tool of choice: Terraform

Architecture used:

Frontend
Backend
Database

Note: This is just a proof of concept, without complex modules, variables, or additional tools involved.

EC2 instances should not be used; instead, EKS or ECS should be leveraged for scalability and better resource management.

All resources created in the modules directory should be designed as templates per resource.

User data scripts should be avoided. Instead, backend/frontend code should be stored in a version control platform (e.g., GitLab, GitHub) and follow CI/CD principles for building, scanning, and deployment.

