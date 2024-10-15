output "all_purpose_cluster_id" {
  value = databricks_cluster.all_purpose_cluster.id
  description = "ID of the all-purpose compute cluster"
}

output "sql_compute_cluster_id" {
  value = databricks_sql_endpoint.sql_compute.id
  description = "ID of the SQL compute cluster"
}
