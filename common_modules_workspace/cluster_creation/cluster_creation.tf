# Create an all-purpose compute cluster
resource "databricks_cluster" "all_purpose_cluster" {
  cluster_name            = var.cluster_name
  spark_version           = var.spark_version
  node_type_id            = var.node_type_id
  autoscale {
    min_workers = var.min_workers
    max_workers = var.max_workers
  }
  autotermination_minutes = var.autotermination_minutes
  spark_conf = {
    "spark.databricks.cluster.profile" = var.spark_profile
    "spark.master" = "local[*]"
  }
  custom_tags = {
    "ClusterType" = var.cluster_type
  }
}

# Create a SQL compute cluster
resource "databricks_sql_endpoint" "sql_compute" {
  name        = var.sql_compute_name
  cluster_size = var.sql_cluster_size
  min_num_clusters = var.sql_min_num_clusters
  max_num_clusters = var.sql_max_num_clusters
  auto_stop_mins = var.sql_auto_stop_mins
}