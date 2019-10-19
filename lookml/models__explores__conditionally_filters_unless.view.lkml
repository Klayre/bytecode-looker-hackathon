view: models__explores__conditionally_filters_unless {
    view_label: "Explores"
#       sql:  select  m.sha as model_sha,
#                     m.path as model_path,
#                     ex.value:name::varchar as explore_name,
#                     cfu.value::varchar as field_name
#             from lookml.models m
#             , lateral flatten(input => m.explores) ex
#             , lateral flatten(input => ex.value:conditionally_filter:unless) cfu ;;

    dimension: conditionally_filter_unless_pk {
      group_label: "Conditionally Filters"
      label: "Conditionally Filters PK"
      type: string
      primary_key: yes
      sql: ${models__explores.explores_pk} || '-' || ${field_name}  ;;
      hidden: yes
    }

    dimension: field_name {
      group_label: "Conditionally Filters"
      label: "Unless Field Name"
      type: string
      sql: cfu.value::varchar ;;
    }

    measure: count {
      label: "Number of Conditionally Filters Unless Fields"
      type: count
      drill_fields: [detail*]
    }

  set: detail {
    fields: [
      model_files.model_name,
      models__explores.name,
      field_name
    ]
  }

  }
