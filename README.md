# Databricks AWS Terraform
This repository simplifies infrastructure automation for data engineers and cloud architects by automating the provisioning of Databricks environments on AWS using Terraform. It supports scalable, consistent environments for development, staging, and production with CI/CD integration through Azure DevOps.

An Azure DevOps pipeline has been set up to streamline the deployment process, enabling you to trigger Terraform commands automatically and manage resources through continuous integration and delivery (CI/CD).

## Prerequisites

To use this repository, you will need:
Terraform (version X.X.X or higher)
AWS (configured with appropriate IAM credentials)
Azure DevOps (for running the pipeline)
Databricks Account

## Module Overview
1. Backend Infrastructure
    backend_infra: Manages the remote backend for Terraform state. This stores Terraform state remotely, ensuring team collaboration and state consistency.

2. Common Infrastructure
    logging: Sets up logging resources for tracking Databricks operations and monitoring cloud infrastructure activity.
    unity_catalog: Manages Unity Catalog, which governs structured data access across workspaces for better data management and governance.

3. Common Modules (Account)
    identity_assignment: Automates the assignment of users, groups, and roles to Databricks workspaces. This ensures role-based access control (RBAC) is implemented correctly.
    metastore_assignment: Configures and assigns the Databricks metastore to the created workspaces. This connects the workspace to Unity Catalog for data governance.
    workspace_creation: Automates the creation and configuration of Databricks workspaces, attaching necessary cloud resources like storage, networking, and security.

4. Common Modules (Cloud Provider)
    cloud_provider_credential: Manages AWS credentials for interacting with Databricks resources.
    cloud_provider_network: Configures AWS VPC, subnets, and security groups for Databricks operations.
    cloud_provider_storage: Configures S3 buckets required for storing data in Databricks.

5. Common Modules (Workspace)
    cluster_creation: Provisions and configures Databricks clusters to handle data workloads.
    cluster_policy: Sets cluster policies to control permissions for users and groups, ensuring that cost control and operational compliance are enforced.
    uc_workspace_catalog: Configures Unity Catalog workspaces for managing and governing structured datasets.

6. Environment-Specific Modules
    databricks_dev: Contains environment-specific configuration for the development environment. To create a new environment, copy the databricks_dev folder, rename it to databricks_prod, and modify the workspace_env.tfvars file to match the production configuration. Update the pipeline configuration to reference the new environment-specific .tfvars file.

## Setting up Environment Variables

The setup for this project requires environment variables for different Terraform modules, particularly for common infrastructure, cloud provider, workspace, and identity assignment. Each module has its own set of variables that must be defined in .tfvars files for successful execution.

### Common Infrastructure Setup
   When setting up these infrastructure components, you must specify the variable files (logging.tfvars and unity_catalog.tfvars) when running Terraform commands.

### Environment-Specific Setup
   

## How to Use These Variable Files in the Pipeline
When running Terraform through Azure DevOps, the pipeline is configured to automatically reference the correct .tfvars files based on the environment. In your Azure pipeline setup, you should:
    1. Ensure that each environment (e.g., dev, prod) has its own set of .tfvars files.
    2. Configure the pipeline to read the appropriate .tfvars file, such as workspace_env.tfvars, logging.tfvars, or unity_catalog.     tfvars, for each environment.
    3. Pass these variable files as arguments to the terraform plan and terraform apply commands in the pipeline configuration.
    Pipeline Setup (Azure DevOps)


## Setting up the Azure Pipeline

This project uses Azure DevOps pipelines to run Terraform commands and provision the Databricks infrastructure.
1. AWS Credentials via Service Connection:
    Go to Project Settings > Service Connections in Azure DevOps.
    Create an AWS service connection by providing your AWS Access Key ID and Secret Access Key.
    This securely stores your AWS credentials and automatically grants the pipeline access to your AWS resources. No need to expose or handle these credentials manually within the pipeline configuration.

2. Running the Pipeline
    Clone the Repository
    Navigate to Azure DevOps and create a new pipeline.
    Select the YAML pipeline and point it to the GitHub repository.
    The repository includes a azure-pipelines.yml file that contains the necessary steps for running the Terraform commands (init, plan, and apply).

## Running the Pipeline
Once your Azure DevOps pipeline is set up and configured, you can trigger the pipeline via the DevOps interface. This will run the following steps:

terraform init: Initializes the Terraform backend and downloads provider plugins.
terraform plan: Creates a plan for the resources that will be provisioned or updated.
terraform apply: Applies the changes and provisions the required Databricks and AWS resources.
The pipeline will automatically output information such as workspace IDs, cluster configurations, and other essential details.

## Errors
Common Issues
1. Terraform Apply Fails with Permission Errors
    Possible Cause: This often happens if the AWS credentials or Databricks token used in the pipeline lack the necessary permissions.
    Solution: Ensure that the AWS credentials provided have the correct IAM roles and permissions. For Databricks, verify that the token has sufficient access rights for workspace management and cluster creation via the Databricks API.
    Action Steps:
        1. Check that the service connection in Azure DevOps has the appropriate roles.
        2. Ensure that the Databricks token is associated with a user or service principal that has admin-level access to the workspace.
2. Pipeline Fails During the Apply Stage
    Possible Cause: This can occur if environment variables in Azure DevOps are not configured correctly or if there are missing secrets or credentials.
    Solution: Double-check the configuration of all environment variables and secrets in Azure DevOps. Ensure that each variable is properly referenced and that all sensitive information is securely stored.
    Action Steps:
        1. Review the pipeline logs for detailed error messages.
        2. Verify that the terraform apply command is receiving all necessary variables (e.g., workspace name, AWS region) from the pipeline configuration.

## FAQ

1. Can I use these modules for production environments?
    Yes, the modules are designed for reusability across different environments (development, staging, production). To use them for production, create a new environment folder (e.g., databricks_prod) and customize the workspace_env.tfvars file to match the production configuration. This allows for consistent infrastructure across environments with minimal effort.
    
3. What if I need to customize clusters for specific workloads?
    To customize clusters for different workloads, you can modify the cluster_creation module by adjusting the parameters passed via the environment-specific .tfvars file. This allows you to configure clusters with different instance types, sizes, autoscaling policies, and other settings to match the workload's requirements.


