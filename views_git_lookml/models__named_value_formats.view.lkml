view: models__named_value_formats {
  view_label: "Named Value Formats"
#     sql:  select  m.sha as model_sha,
#                   m.path as model_path,
#                   m.named_value_formats,
#                   nvf.value:name::varchar as name,
#                   nvf.value:value_format::varchar as value_format,
#                   nvf.value:strict_value_format::varchar as strict_value_format
#           from lookml.models m
#           , lateral flatten(input => m.named_value_formats) nvf ;;

  dimension: named_value_formats_pk {
    label: "Named Value Formats PK"
    type: string
    primary_key: yes
    sql: ${models.model_pk} || '-' ${name} ;;
    hidden: yes
  }

  dimension: name {
    label: "Named Value Format Name"
    type: string
    sql: nvf.value:name::varchar ;;
  }

  dimension: value_format {
    label: "Value Format"
    type: string
    sql: nvf.value:value_format::varchar ;;
  }

  dimension: strict_value_format {
    label: "Strict Value Format"
    type: string
    sql: nvf.value:strict_value_format::varchar ;;
  }

  measure: count {
    label: "Number of Named Value Formats"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      name,
      value_format,
      strict_value_format
    ]
  }

}
