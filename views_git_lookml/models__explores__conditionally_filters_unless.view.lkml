view: models__explores__conditionally_filters_unless {
    view_label: "Explores: Conditionally Filters Unless"
#       sql:  select  m.sha as model_sha,
#                     m.path as model_path,
#                     ex.value:name::varchar as explore_name,
#                     cfu.value::varchar as field_name
#             from lookml.models m
#             , lateral flatten(input => m.explores) ex
#             , lateral flatten(input => ex.value:conditionally_filter:unless) cfu ;;

    dimension: conditionally_filter_unless_pk {
      label: "Conditionally Filters PK"
      type: string
      primary_key: yes
      sql: ${models__explores.explores_pk} || '-' || ${field_name}  ;;
      hidden: yes
    }

    dimension: field_name {
      label: "Field Name"
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
