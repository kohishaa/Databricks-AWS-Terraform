# Output the group name for further usage
output "workspace_dataengineer_group_name" {
  value = databricks_group.workspace_dataengineer_group.display_name
}

# Output the group ID for usage
output "workspace_dataengineer_group_id" {
  value = databricks_group.workspace_dataengineer_group.id
}