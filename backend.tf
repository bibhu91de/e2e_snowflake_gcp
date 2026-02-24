terraform{
    backend "gcs"{
        bucket = "terraform-state-bibhu"
        prefix = "snowflake/analytics"
    }
}