resource "snowflake_table" "customers_public"{
    database = snowflake_database.analytics.name
    schema = snowflake_schema.non_pii.name
    name= "CUSTOMERS_PUBIC"

    column{
        name= "customer_id"
        type= "NUMBER"
    }


    column {
        name = "COUNTRY"
        type = "VARCHAR(50)"
    }

    column {
        name = "SIGNUP_DATE"
        type = "DATE"
    }

    comment = "Non-PII customer attributes safe for analysts"
}