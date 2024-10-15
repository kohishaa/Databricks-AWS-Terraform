output "workspace_url" {
  value = module.workspace.workspace_url
}

output "workspace_id" {
  value = module.workspace.workspace_id
}
output "dataengineer_group_name"{
    value = module.identity_assignment.dataengineer_group_name
}
output "user1_name"{
    value = module.identity_assignment.user1_name
}
output "user2_name"{
    value = module.identity_assignment.user2_name
}
output "user3_name"{
    value = module.identity_assignment.user3_name
}