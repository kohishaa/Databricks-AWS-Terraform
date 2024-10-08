// General 
resource_prefix = "" 
resource_owner = ""
#access_key = ""
#secret_key = ""
#securityGroupID = ""

// General - 
aws_account_id = "" 
region = ""

// General - Databricks 
databricks_account_id = ""
client_id = "" 
client_secret = "" 
metastore_id = ""


availability_zones = 
 private_subnets_cidr =
 public_subnets_cidr = 
 sg_egress_ports = 
 sg_egress_protocol = 
 sg_ingress_protocol = 
 vpc_cidr_range = ""
 

// Cloud Provider Storage (Root Storage) 
dbfsname = ""

// Workspace and Catalog Admin 
user_name = ""

// Cluster Policy 
team = ""

# All-Purpose Cluster configuration
workspace_id = ""
workspace_url = ""
cluster_name             = ""
spark_version            = ""
node_type_id             = ""
min_workers              = 
max_workers              = 
autotermination_minutes  = 
spark_profile            = ""
cluster_type             = ""

# SQL Compute Cluster configuration
sql_compute_name         = ""
sql_cluster_size         = ""  # Databricks-specific SQL cluster size
sql_min_num_clusters     = 
sql_max_num_clusters     = 
sql_auto_stop_mins       = 
