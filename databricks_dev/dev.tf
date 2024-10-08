module "cloud_provider" {
    source = "./cloud_provider"
    providers = {
        aws = aws
        databricks = databricks.mws
    }
    aws_account_id        = var.aws_account_id
    databricks_account_id = var.databricks_account_id
    resource_prefix       = var.resource_prefix
    region                = var.region
    vpc_cidr_range        = var.vpc_cidr_range
    availability_zones    = var.availability_zones
    public_subnets_cidr   = var.public_subnets_cidr
    private_subnets_cidr  = var.private_subnets_cidr
    sg_ingress_protocol   = var.sg_ingress_protocol
    sg_egress_ports       = var.sg_egress_ports
    sg_egress_protocol    = var.sg_egress_protocol
    dbfsname              = var.dbfsname
  
}


  module "databricks_account" {
    source = "./databricks_account"
    providers = {
        databricks = databricks.mws
    }

      databricks_account_id  = var.databricks_account_id
      region                 = var.region
      resource_prefix        = var.resource_prefix
      cross_account_role_arn = module.cloud_provider.cloud_provider_credential
      bucket_name            = module.cloud_provider.cloud_provider_storage
      vpc_id                 = module.cloud_provider.cloud_provider_network_vpc
      subnet_ids             = module.cloud_provider.cloud_provider_network_subnets
      security_group_ids     = module.cloud_provider.cloud_provider_network_security_groups
      metastore_id           = var.metastore_id
      user_name              = var.user_name
  depends_on = [ module.cloud_provider ] 
}
 

module "databricks_workspace" {
    source = "./databricks_workspace"
     providers = {
        aws = aws
        databricks = databricks.workspace
    }

    aws_account_id        = var.aws_account_id
    databricks_account_id = var.databricks_account_id
    resource_prefix       = var.resource_prefix
    workspace_id          = module.databricks_account.workspace_id
    uc_catalog_name       = "${var.resource_prefix}-catalog-${module.databricks_account.workspace_id}"
    schema_name           = "${var.resource_prefix}-schema-${module.databricks_account.workspace_id}"
    volume_name           = "${var.resource_prefix}-volume-${module.databricks_account.workspace_id}"
    workspace_catalog_admin = var.user_name
    team = var.team


    # Cluster creation variables

    cluster_name          = var.resource_prefix
    spark_version         = var.spark_version
    node_type_id          = var.node_type_id
    min_workers           = var.min_workers
    max_workers           = var.max_workers
    autotermination_minutes = var.autotermination_minutes
    spark_profile         = var.spark_profile
    cluster_type          = var.cluster_type

    # SQL Compute creation variables
    sql_compute_name      = var.resource_prefix
    sql_cluster_size      = var.sql_cluster_size
    sql_min_num_clusters  = var.sql_min_num_clusters
    sql_max_num_clusters  = var.sql_max_num_clusters
    sql_auto_stop_mins    = var.sql_auto_stop_mins

    workspace_url = module.databricks_account.workspace_url

      depends_on = [ module.databricks_account ]
} 
