variable "region" {
  type        = string
}

variable "databricks_account_id" {
  type        = string
}

variable "client_id" {
  type        = string
}

variable "client_secret" {
  type        = string
}

variable "resource_owner" {
  type        = string
}

variable "resource_prefix" {
  type        = string
}

#variable "access_key" {
 # type = string
  
#}

#variable "secret_key" {
 # type = string
#}

variable "aws_account_id" {
  type = string
}

variable "tags" {
  type = map(string)
}