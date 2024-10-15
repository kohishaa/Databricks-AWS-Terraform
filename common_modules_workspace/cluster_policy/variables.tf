variable "team" {
  type        = string
}

variable "policy_overrides" {
  type        =  map(object({type = string, value = string}))
}
variable "all_purpose_cluster_id" {
  type = string
}
variable "sql_compute_cluster_id" {
  type = string
}

variable "group_name" {
  type = string
}