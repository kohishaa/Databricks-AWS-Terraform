variable "aws_account_id" {
  type = string
}

variable "resource_prefix" {
  type = string
}

variable "databricks_account_id" {
  type = string
}

variable "workspace_id" {
  type = string
}

variable "workspace_url" {
  type = string
}

variable "uc_catalog_name" {
  type = string
}
variable "schema_name" {
  type = string
}
variable "volume_name" {
  type = string
}


variable "workspace_catalog_admin" {
  type = string
}

variable "team" {
  type = string
}

# Additional variables for cluster creation
variable "cluster_name" {
  type = string
}

variable "spark_version" {
  type = string
}

variable "node_type_id" {
  type = string
}

variable "min_workers" {
  type = number
}

variable "max_workers" {
  type = number
}

variable "autotermination_minutes" {
  type = number
}

variable "spark_profile" {
  type = string
}

variable "cluster_type" {
  type = string
}

variable "sql_compute_name" {
  type = string
}

variable "sql_cluster_size" {
  type = string
}

variable "sql_min_num_clusters" {
  type = number
}

variable "sql_max_num_clusters" {
  type = number
}

variable "sql_auto_stop_mins" {
    type = number
   
 }

