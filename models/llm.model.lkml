connection: "argolis_asw"

# include all the views
include: "/views/**/*.view"

datagroup: llm_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: llm_default_datagroup

explore: llm_or_dataset {}
