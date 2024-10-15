resource "databricks_group_member" "workspace_group_membership_user1"{
    group_id = var.group_id
    member_id = var.user1_id #passed from databricks_account output
    depends_on = [ var.group_id ]
}

resource "databricks_group_member" "workspace_group_membership_user2"{
    group_id = var.group_id
    member_id = var.user2_id #passed from databricks_account output
    depends_on = [ var.group_id ]
}

resource "databricks_group_member" "workspace_group_membership_user3"{
    group_id = var.group_id
    member_id = var.user3_id #passed from databricks_account output
    depends_on = [ var.group_id ]
}
