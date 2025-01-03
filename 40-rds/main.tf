module "db" {
  source = "terraform-aws-modules/rds/aws"   #this is source 

  identifier = local.resource_name #dataase name

  engine            = "mysql" #select the engine which you want
  engine_version    = "8.0" #select the version 
  instance_class    = "db.t3.micro" #select the instance 
  allocated_storage = 5  #give the staorage how much do you want

  db_name  = "transaction"  # create a database wit name transactions
  username = "root"  #this is root 
  manage_master_user_password = false  #this instruction tells dont use the managed master user password  
  password = "ExpenseApp1"  #give the passwoprd you like
  port     = "3306"  # give the port no (default database port is 3306)

  vpc_security_group_ids = [local.mysql_sg_id]  #this is the mysql security group id (this sg id takes from aws parameter store)
  skip_final_snapshot = true  #this instructore used to skip the final snapshot beacause this final snapshot attached the vpc after attaching we cant delete the vpc
  
  tags = merge(   #this is naming tags
    var.common_tags,
    var.rds_tags
  )

  # DB subnet group
  db_subnet_group_name = local.database_subnet_group_name  #this is the database subnet group (all the database subnets are placed in database group)
  # DB parameter group
  family = "mysql8.0"

  # DB option group
  major_engine_version = "8.0"


  parameters = [    #all this information placed in default we wont do any changes
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}


# RDS is used for database (we are not creating seperate servers for database we create RDS for database )
# go to the google and pic type "AWS RDS MODULE TERRAFORM" pic the module from pre defined modules
# modifying the values with actual values