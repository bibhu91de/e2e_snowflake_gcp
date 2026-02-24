resource "snowflake_table" "customers_private" {
  database = snowflake_database.analytics.name
  schema   = snowflake_schema.pii.name
  name     = "CUSTOMERS_PRIVATE"

  column {
    name = "CUSTOMER_ID"
    type = "NUMBER"
  }

  column {
    name           = "EMAIL"
    type           = "VARCHAR(255)"
    masking_policy = "ANALYTICS.PII.PII_STRING_MASK"
  }

  column {
    name           = "PHONE"
    type           = "VARCHAR(20)"
    masking_policy = "ANALYTICS.PII.PII_STRING_MASK"
  }
}