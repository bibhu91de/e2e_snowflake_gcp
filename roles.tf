resource "snowflake_account_role" "analyst" {
  name = "ANALYST_ROLE"
}

resource "snowflake_account_role" "pii_reader" {
  name = "PII_READER_ROLE"
}