resource "aws_glue_catalog_table" "tabela_sot" {
  name            = var.tabela_sot
  database_name   = var.database_sot
  table_type      = "EXTERNAL_TABLE"
  
  parameters = {
    classification = "parquet"
  }

  partition_keys {
    name           = "anomes"
    type           = "int"
  }

  storage_descriptor {
    location       = "${var.sot_s3_bucket}/${var.tabela_sot}"
    input_format   = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"
    ser_de_info {
      name = var.tabela_sot
      serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"
      parameters = {
        "serialization.format" = "1"
      }
    }

    columns {
        name           = "id"
        type           = "int"
  }

    columns {
        name           = "trans_date_trans_time"
        type           = "timestamp"
    }

    columns {
        name           = "cc_num"
        type           = "string"
    }

    columns {
        name           = "category"
        type           = "string"
    }

    columns {
        name           = "amt"
        type           = "decimal(18, 2)"
    }

    columns {
        name           = "first_name"
        type           = "string"
    }

    columns {
        name           = "last_name"
        type           = "string"
    }

    columns {
        name           = "gender"
        type           = "string"
    }

    columns {
        name           = "dob"
        type           = "date"
    }

    columns {
        name           = "dt_carga"
        type           = "timestamp"
    }
  }
}




    
    