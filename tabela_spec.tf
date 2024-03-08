resource "aws_glue_catalog_table" "tabela_spec" {
  name            = var.tabela_spec
  database_name   = var.database_spec
  table_type      = "EXTERNAL_TABLE"

  parameters = {
    classification = "parquet"
  }

  partition_keys {
    name           = "ano_mes_transacoes"
    type           = "int"
  }
  
  storage_descriptor {
    location       = "${var.spec_s3_bucket}/${var.tabela_sot}/"
    input_format   = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"
    ser_de_info {
      name = var.tabela_spec
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"
      parameters = {
        "serialization.format" = "1"
      }
    }
  
    columns {
      name           = "numero_cartao_credito_cliente"
      type           = "string"
    }

    columns {
      name           = "nome_cliente"
      type           = "string"
    }

    columns {
      name           = "sobrenome_cliente"
      type           = "string"
    }

    columns {
      name           = "gender"
      type           = "string"
    }

    columns {
      name           = "idade_cliente"
      type           = "int"
    }

    columns {
      name           = "soma_valor_transacoes"
      type           = "decimal(18, 2)"
    }

    columns {
      name           = "qtd_transacoes"
      type           = "int"
    }

    columns {
      name           = "dt_carga"
      type           = "timestamp"
    }
  }
}
