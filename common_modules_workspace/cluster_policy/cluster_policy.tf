locals {
  default_policy = {
    "dbus_per_hour" : {
      "type" : "range",
      "maxValue" : 10
    },
    "autotermination_minutes" : {
      "type" : "fixed",
      "value" : 20,
      "hidden" : true
    },
    "custom_tags.Team" : {
      "type" : "fixed",
      "value" : var.team
    }
  }
}

resource "databricks_cluster_policy" "fair_use" {
  name       = "${var.team} cluster policy"
  definition = jsonencode(merge(local.default_policy, var.policy_overrides))
}

//Assign cluster access to the group

resource "databricks_permissions" "all_purpose_cluster_access"{
  cluster_id = var.all_purpose_cluster_id  
  access_control {
   group_name = var.group_name
  permission_level = "CAN_ATTACH_TO"
  }
  depends_on = [ var.all_purpose_cluster_id ]
}
resource "databricks_permissions" "sql_compute_cluster_access"{
  sql_endpoint_id = var.sql_compute_cluster_id
  access_control {
   group_name = var.group_name
  permission_level = "CAN_USE"
  }
  depends_on = [ var.sql_compute_cluster_id ]
}
