variable "availability_zones" {
  type        = list(string)
}

variable "aws_account_id" {
  type        = string
}

variable "client_id" {
  type        = string
}

variable "client_secret" {
  type        = string
}

variable "databricks_account_id" {
  type        = string
}

variable "dbfsname" {
  type        = string
}

variable "metastore_id" {
  type        = string
}

variable "private_subnets_cidr" {
  type        = list(string)
}

variable "public_subnets_cidr" {
  type        = list(string)
}

variable "region" {
  type        = string
}

variable "resource_prefix" {
  type        = string
}

variable "resource_owner" {
  type        = string
}

variable "sg_egress_ports" {
  type        = list(any)
}

variable "sg_egress_protocol" {
  type        = list(any)
}

variable "sg_ingress_protocol" {
  type        = list(any)
}

variable "team" {
  type        = string
}

variable "user_name" {
  type        = string
}

variable "vpc_cidr_range" {
  type        = string
}

/* variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
} */

# General variables


variable "workspace_id" {
  type = string
}

variable "workspace_url" {
  type = string
}

# All-purpose cluster variables
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

# SQL Compute cluster variables
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

