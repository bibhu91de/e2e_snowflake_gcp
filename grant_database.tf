resource "snowflake_grant_privileges_to_account_role" "analytics_db_usage_analyst" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.analytics.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "analytics_db_usage_pii" {
  account_role_name = snowflake_account_role.pii_reader.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.analytics.name
  }
}
resource "snowflake_grant_privileges_to_account_role" "non_pii_schema_usage_analyst" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["USAGE"]

  on_schema {
    schema_name = "\"${snowflake_database.analytics.name}\".\"${snowflake_schema.non_pii.name}\""
  }
}
resource "snowflake_grant_privileges_to_account_role" "non_pii_schema_usage_pii" {
  account_role_name = snowflake_account_role.pii_reader.name
  privileges        = ["USAGE"]

  on_schema {
    schema_name = "\"${snowflake_database.analytics.name}\".\"${snowflake_schema.non_pii.name}\""
  }
}
resource "snowflake_grant_privileges_to_account_role" "pii_schema_usage" {
  account_role_name = snowflake_account_role.pii_reader.name
  privileges        = ["USAGE"]

  on_schema {
    schema_name = "\"${snowflake_database.analytics.name}\".\"${snowflake_schema.pii.name}\""
  }
}
resource "snowflake_grant_privileges_to_account_role" "non_pii_future_select_analyst" {
  account_role_name = snowflake_account_role.analyst.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = "\"${snowflake_database.analytics.name}\".\"${snowflake_schema.non_pii.name}\""
    }
  }
}
resource "snowflake_grant_privileges_to_account_role" "non_pii_future_select_pii" {
  account_role_name = snowflake_account_role.pii_reader.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = "\"${snowflake_database.analytics.name}\".\"${snowflake_schema.non_pii.name}\""
    }
  }
}
resource "snowflake_grant_privileges_to_account_role" "pii_future_select" {
  account_role_name = snowflake_account_role.pii_reader.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = "\"${snowflake_database.analytics.name}\".\"${snowflake_schema.pii.name}\""
    }
  }
}