output "dataengineer_group_name"{
    value = databricks_group.dataengineer.display_name
}
output "dataengineer_group_id"{
    value = databricks_group.dataengineer.id
}
output "databricks_group_membership_user1" {
  value = databricks_group_member.databricks_group_membership_user1.member_id
}

output "workspace_group_membership_user2" {
  value = databricks_group_member.databricks_group_membership_user2.member_id
}

output "workspace_group_membership_user3" {
  value = databricks_group_member.databricks_group_membership_user3.member_id
}

output "user1_id"{
    value = databricks_user.user1.id
}
output "user2_id"{
    value = databricks_user.user2.id
}
output "user3_id"{
    value = databricks_user.user3.id
}