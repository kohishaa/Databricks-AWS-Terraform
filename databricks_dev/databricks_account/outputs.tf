output "workspace_url" {
  value = module.workspace.workspace_url
}

output "workspace_id" {
  value = module.workspace.workspace_id
}

output "dataengineer_group_name"{
    value = module.identity_assignment.dataengineer_group_name
}

output "dataengineer_group_id"{
    value = module.identity_assignment.dataengineer_group_id
}
output "user1_id"{
    value = module.identity_assignment.user1_id
}
output "user2_id"{
    value = module.identity_assignment.user2_id
}
output "user3_id"{
    value = module.identity_assignment.user3_id
}