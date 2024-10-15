data "databricks_user" "user" {
  user_name = var.user_name
}
resource "databricks_user" "user1" {
  user_name = var.user_name1
}

resource "databricks_user" "user2" {
  user_name = var.user_name2
}

resource "databricks_user" "user3" {
  user_name = var.user_name3
}

//create dataengineer group

resource "databricks_group" "dataengineer" {
  display_name = var.group_name
  #Sallow_cluster_create       = false
}

// add users to data engineer group

resource "databricks_group_member" "databricks_group_membership" {
  group_id  = databricks_group.dataengineer.id
  member_id = databricks_user.user1.id  # For user 1
}

resource "databricks_group_member" "databricks_group_membership_user2" {
  group_id  = databricks_group.dataengineer.id
  member_id = databricks_user.user2.id  # For user 2
}

resource "databricks_group_member" "databricks_group_membership_user3" {
  group_id  = databricks_group.dataengineer.id
  member_id = databricks_user.user3.id  # For user 3
}


resource "databricks_mws_permission_assignment" "user" {
  workspace_id = var.workspace_id
  principal_id = data.databricks_user.user.id
  permissions  = ["ADMIN"]
}
// Assign MWS Permissions to user1
resource "databricks_mws_permission_assignment" "user_mws_permissions_user1" {
  workspace_id = var.workspace_id
  principal_id = databricks_user.user1.id
  permissions  = ["USER"]
}

// Assign MWS Permissions to user2
resource "databricks_mws_permission_assignment" "user_mws_permissions_user2" {
  workspace_id = var.workspace_id
  principal_id = databricks_user.user2.id
  permissions  = ["ADMIN"]
}

// Assign MWS Permissions to user3
resource "databricks_mws_permission_assignment" "user_mws_permissions_user3" {
  workspace_id = var.workspace_id
  principal_id = databricks_user.user3.id
  permissions  = ["USER"]
}
#depends_on = [ data.databricks_user.user ]
