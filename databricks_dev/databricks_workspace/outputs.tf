output "all_purpose_cluster_id" {
  value = module.cluster_creation.all_purpose_cluster_id
  description = "ID of the all-purpose compute cluster"
}

output "sql_compute_cluster_id" {
  value = module.cluster_creation.sql_compute_cluster_id
  description = "ID of the SQL compute cluster"
}
