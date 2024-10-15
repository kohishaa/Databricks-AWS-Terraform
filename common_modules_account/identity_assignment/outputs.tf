output "dataengineer_group_name"{
    value = databricks_group.dataengineer.display_name
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