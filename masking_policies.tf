resource "snowflake_masking_policy" "pii_string_mask"{
    name = "PII_STRING_MASK"
    database = snowflake_database.analytics.name
    schema = snowflake_schema.pii.name

    argument {
        name = "VAL"
        type = "VARCHAR"
    }
    return_data_type = "VARCHAR"

    body = <<-SQL
    CASE
      WHEN CURRENT_ROLE() IN ('PII_READER_ROLE') THEN VAL
      ELSE '***MASKED***'
    END
  SQL

  comment = "MASK PII Strings columns for non PII users"
}