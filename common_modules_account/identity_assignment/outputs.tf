output "dataengineer_group_name"{
    value = databricks_group.dataengineer.display_name
}
output "user1_name"{
    value = databricks_user.user1.user_name
}
output "user2_name"{
    value = databricks_user.user2.user_name
}
output "user3_name"{
    value = databricks_user.user3.user_name
}