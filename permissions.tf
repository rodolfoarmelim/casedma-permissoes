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

resource "aws_lakeformation_permissions" "database_permissions_sor_producer" {
  principal = var.producer_role_arn_mesh
  permissions = ["SELECT", "INSERT", "ALTER", "DROP"]
  table {
    database_name = var.database_sor
    name = var.tabela_sor
  }
}

resource "aws_lakeformation_permissions" "database_permissions_sot_producer" {
  principal = var.producer_role_arn_mesh
  permissions = ["SELECT", "INSERT", "ALTER", "DROP"]
  table {
    database_name = var.database_sot
    name = var.tabela_sot
  }
}

resource "aws_lakeformation_permissions" "database_permissions_spec_producer" {
  principal = var.producer_role_arn_mesh
  permissions = ["SELECT", "INSERT", "ALTER", "DROP"]
  table {
    database_name = var.database_spec
    name = var.tabela_spec
  }
}

resource "aws_lakeformation_permissions" "table_permission_sor_producer" {
  principal = var.producer_role_arn_mesh
  permissions = ["SELECT", "INSERT", "ALTER", "DROP"]
  table {
    database_name = var.database_sor
    name = var.tabela_sor
  }
}

resource "aws_lakeformation_permissions" "table_permission_sot_producer" {
  principal = var.producer_role_arn_mesh
  permissions = ["SELECT", "INSERT", "ALTER", "DROP"]
  table {
    database_name = var.database_sot
    name = var.tabela_sot
  }
}

resource "aws_lakeformation_permissions" "table_permission_spec_producer" {
  principal = var.producer_role_arn_mesh
  permissions = ["SELECT", "INSERT", "ALTER", "DROP"]
  table {
    database_name = var.database_spec
    name = var.tabela_spec
  }
}

resource "aws_lakeformation_permissions" "table_permission_sor_consumer" {
  for_each = toset(var.lista_consumidores)
  principal = each.key
  permissions = ["SELECT"]
  table {
    database_name = var.database_sor
    name = var.tabela_sor
  }
}

resource "aws_lakeformation_permissions" "table_permission_sot_consumer" {
  for_each = toset(var.lista_consumidores)
  principal = each.key
  permissions = ["SELECT"]
  table {
    database_name = var.database_sot
    name = var.tabela_sot
  }
}

resource "aws_lakeformation_permissions" "table_permission_spec_consumer" {
  for_each = toset(var.lista_consumidores)
  principal = each.key
  permissions = ["SELECT"]
  table {
    database_name = var.database_spec
    name = var.tabela_spec
  }
}