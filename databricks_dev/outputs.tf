# Outputs from Cloud Provider Module


# Output for VPC ID
output "cloud_provider_vpc_id" {
  value = module.cloud_provider.cloud_provider_network_vpc
}

# Output for Subnet IDs
output "cloud_provider_subnet_ids" {
  value = module.cloud_provider.cloud_provider_network_subnets
}

# Output for Security Group IDs
output "cloud_provider_security_groups" {
  value = module.cloud_provider.cloud_provider_network_security_groups
}


# Outputs from Databricks Account Module

# Output for Databricks Workspace ID
output "workspace_id" {
  value = module.databricks_account.workspace_id
}

# Output for Databricks Workspace URL
output "workspace_url" {
  value = module.databricks_account.workspace_url
}



# Outputs from Databricks Workspace Module

# Output for All-Purpose Cluster ID
output "all_purpose_cluster_id" {
  value = module.databricks_workspace.all_purpose_cluster_id
}

# Output for SQL Compute Cluster ID
output "sql_compute_cluster_id" {
  value = module.databricks_workspace.sql_compute_cluster_id
}





