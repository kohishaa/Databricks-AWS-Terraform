module "uc_catalog" {
  source = "../../common_modules_workspace/uc_workspace_catalog"

  databricks_account_id   = var.databricks_account_id
  aws_account_id          = var.aws_account_id
  resource_prefix         = var.resource_prefix
  uc_catalog_name         = "${var.resource_prefix}-catalog-${var.workspace_id}"
  schema_name             = "${var.resource_prefix}-schema-${var.workspace_id}"
  volume_name             = "${var.resource_prefix}-volume-${var.workspace_id}"
  workspace_id            = var.workspace_id
  workspace_catalog_admin = var.workspace_catalog_admin
  
}

module "dev_compute_policy" {
  source = "../../common_modules_workspace/cluster_policy"
  team   = var.team
  policy_overrides = {
    "spark_conf.spark.databricks.io.cache.enabled" : {
      "type" : "fixed",
      "value" : "true"
    },
  }
}

module "cluster_creation" {
  source = "../../common_modules_workspace/cluster_creation"

  # Pass workspace ID 
  
  workspace_url   = var.workspace_url


  # Pass variables for all-purpose cluster
  cluster_name             = var.resource_prefix
  spark_version            = var.spark_version
  node_type_id             = var.node_type_id
  min_workers              = var.min_workers
  max_workers              = var.max_workers
  autotermination_minutes  = var.autotermination_minutes
  spark_profile            = var.spark_profile
  cluster_type             = var.cluster_type

  # Pass variables for SQL compute cluster
  sql_compute_name         = var.resource_prefix
  sql_cluster_size         = var.sql_cluster_size
  sql_min_num_clusters     = var.sql_min_num_clusters
  sql_max_num_clusters     = var.sql_max_num_clusters
  sql_auto_stop_mins       = var.sql_auto_stop_mins
}



