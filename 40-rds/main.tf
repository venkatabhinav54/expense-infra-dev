module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = local.resource_name

  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  db_name  = "transaction"
  username = "root"
  manage_master_user_password = false
  password = "ExpenseApp1"
  port     = "3306"

  vpc_security_group_ids = [local.mysql_sg_id]

  
  tags = merge(
    var.common_tags,
    var.rds_tags
  )

  # DB subnet group
  db_subnet_group_name = local.database_subnet_group_name
  # DB parameter group
  family = "mysql8.0"

  # DB option group
  major_engine_version = "8.0"


  parameters = [
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