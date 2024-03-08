resource "aws_lakeformation_permissions" "describe_sor" {
    principal   = var.producer_role_arn_mesh
    permissions = ["DESCRIBE"]

    database {
      name       = var.database_sor
      catalog_id = var.control_account
    }
}

resource "aws_lakeformation_permissions" "describe_sot" {
    principal   = var.producer_role_arn_mesh
    permissions = ["DESCRIBE"]

    database {
        name       = var.database_sot
        catalog_id = var.control_account
    }
}

resource "aws_lakeformation_permissions" "describe_spec" {
    principal   = var.producer_role_arn_mesh
    permissions = ["DESCRIBE"]

    database {
        name       = var.database_spec
        catalog_id = var.control_account
    }
}

resource "aws_lakeformation_permissions" "database_permissions_sor" {
  database_name = var.database_sor
  permissions {
    principal        = var.producer_role_arn_mesh
    resource         = "table://${var.database_sor}.${var.tabela_sor}"
    permissions      = ["SELECT", "INSERT", "ALTER", "DROP"]
  }
  permissions {
    principal        = var.consumer_role_arn_mesh
    resource         = "table://${var.database_sor}.${var.tabela_sor}"
    permissions      = ["SELECT"]
  }
}

resource "aws_lakeformation_permissions" "database_permissions_sot" {
  database_name = var.database_sot
  permissions {
    principal        = var.producer_role_arn_mesh
    resource         = "table://${var.database_sot}.${var.tabela_sot}"
    permissions      = ["SELECT", "INSERT", "ALTER", "DROP"]
  }
  permissions {
    principal        = var.consumer_role_arn_mesh
    resource         = "table://${var.database_sot}.${var.tabela_sot}"
    permissions      = ["SELECT"]
  }
}

resource "aws_lakeformation_permissions" "database_permissions_spec" {
  database_name = var.database_spec
  permissions {
    principal        = var.producer_role_arn_mesh
    resource         = "table://${var.database_spec}.${var.tabela_spec}"
    permissions      = ["SELECT", "INSERT", "ALTER", "DROP"]
  }
  permissions {
    principal        = var.consumer_role_arn_mesh
    resource         = "table://${var.database_spec}.${var.tabela_spec}"
    permissions      = ["SELECT"]
  }
}
