output "all_purpose_cluster_id" {
  value = databricks_cluster.all_purpose_cluster.id
  
}

output "sql_compute_cluster_id" {
  value = databricks_sql_endpoint.sql_compute.id
  
}
