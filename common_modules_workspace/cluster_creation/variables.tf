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
variable "workspace_url" {
  type = string
}