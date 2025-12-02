📘 README.md — Azure DEV Environment with Terraform
Azure DEV Environment with Terraform

A complete development environment built using Terraform on Azure.
This project deploys:

Resource Group

Virtual Network (VNet)

Subnet

Network Security Group (NSG)

App Service Plan

Linux Web App

App Settings

Output values

Organised using a real-world Terraform structure.

🧱 Architecture Diagram
Resource Group
 ├── Virtual Network (10.0.0.0/16)
 │     └── Subnet (10.0.1.0/24)
 │            └── NSG (Inbound/Outbound rules)
 └── App Service Plan (Linux, B1)
        └── Web App (Linux Web App)
               └── App Settings (ENVIRONMENT = dev)

<img width="1024" height="1536" alt="image" src="https://github.com/user-attachments/assets/dcc09996-48eb-44f5-af22-c0476cf91aff" />


📁 Project Structure
project1/
  main.tf          → Terraform + Provider setup
  network.tf       → VNet, Subnet, NSG
  webapp.tf        → App Service Plan + Web App
  variables.tf     → All variables used in the project
  outputs.tf       → Helpful output values (URL, IDs)
  .gitignore       → Ignores Terraform state files

🚀 Prerequisites

Ensure you have installed:

Terraform (v1.6+ recommended)

Azure CLI

git

VS Code (optional but recommended)

Login to Azure:

az login

🔧 How to Use This Project
1. Initialise Terraform
terraform init

2. Validate configuration
terraform validate

3. Preview changes
terraform plan

4. Deploy
terraform apply

5. Destroy environment
terraform destroy

📝 Configuration (variables.tf)

You can customise:

Variable	Description	Default
resource_group_name	Name of the resource group	dev-rg
location	Azure region	West Europe
webapp_name	Web App name	dev-webapp-001

Example override:

terraform apply -var="location=North Europe"

🌐 Outputs

After deployment Terraform will print:

Web App URL

Subnet ID

These are useful for testing and for linking additional resources.

🔒 Security Considerations

This project uses:

NSG for subnet-level traffic control

HTTPS-only Web App

No secrets stored in Terraform code

.gitignore that excludes state files and sensitive .tfvars files

✨ Future Enhancements (covered in later projects)

Private Endpoints

Azure Storage Account

VNet Integration

Azure DevOps Pipelines

GitHub Actions CI/CD

Terraform Modules

Remote State Backend (Blob Storage)

🤝 Contributing

Feel free to:

Fork

Create a feature branch

Submit a pull request

📄 License
