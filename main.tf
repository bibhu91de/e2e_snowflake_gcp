resource "snowflake_database" "analytics" {
  name = "ANALYTICS"
}

resource "snowflake_schema" "non_pii" {
  database = snowflake_database.analytics.name
  name     = "NON_PII"
}

resource "snowflake_schema" "pii" {
  database = snowflake_database.analytics.name
  name     = "PII"
}