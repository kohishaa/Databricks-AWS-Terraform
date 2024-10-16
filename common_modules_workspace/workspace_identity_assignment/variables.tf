 variable "group_id" {
  description = "The ID of the group created at the workspace level"
  type        = string
} 

variable "user1_id" {
  description = "User1 ID passed from databricks_account output"
  type        = string
}

variable "user2_id" {
  description = "User2 ID passed from databricks_account output"
  type        = string
}

variable "user3_id" {
  description = "User3 ID passed from databricks_account output"
  type        = string
}
