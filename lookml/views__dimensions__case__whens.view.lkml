view: views__dimensions__case__whens {
  view_label: "Dimensions"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimension_groups::variant as dimensions,
#                   d.value::variant as dimension,
#                   d.value:name::varchar as dimension_name,
#                   d.value:"case"::variant as case,
#                   d.value:"case":whens::variant as case_whens,
#                   dcw.value:label::varchar as label,
#                   dcw.value:sql::varchar as sql
#           from lookml.views v
#           , lateral flatten(input => v.dimensions) d
#           , lateral flatten(input => d.value:"case":whens) dcw ;;

  dimension: case_whens_pk {
    group_label: "Case"
    label: "Case Whens PK"
    type: string
    primary_key: yes
    sql: MD5(${views__dimensions.dimension_pk} || '-' || ${label}  || '-' || ${sql}) ;;
    hidden: yes
  }

  dimension: label {
    group_label: "Case"
    label: "Case When Label"
    type: string
    sql: dcw.value:label::varchar ;;
  }

  dimension: sql {
    label: "Case When SQL"
    type: string
    sql: dcw.value:sql::varchar ;;
  }

  measure: count {
    label: "Number of Case Whens"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__dimensions.name,
      label,
      sql
    ]
  }
}
