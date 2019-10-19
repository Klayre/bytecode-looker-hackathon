view: views__measures__links {
  view_label: "Measures"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.measures::variant as measures,
#                   m.value::variant as measure,
#                   m.value:name::varchar as measure_name,
#                   m.value:links::variant as links,
#                   mlnk.value::varchar as link,
#                   mlnk.value:icon_url::varchar as icon_url,
#                   mlnk.value:label::varchar as label,
#                   mlnk.value:url::varchar as url
#           from lookml.views v
#           , lateral flatten(input => v.measures) m
#           , lateral flatten(input => m.value:links) mlnk ;;

  dimension: links_pk {
    group_label: "Links"
    label: "Links PK"
    type: string
    primary_key: yes
    sql: MD5(${views__measures.measure_pk} || '-' || ${label} || '-' || ${url}) ;;
    hidden: yes
  }

  dimension: icon_url {
    group_label: "Links"
    label: "Link Icon URL"
    type: string
    sql: mlnk.value:icon_url::varchar ;;
  }

  dimension: label {
    group_label: "Links"
    label: "Link Label"
    type: string
    sql: mlnk.value:label::varchar ;;
  }

  dimension: url {
    group_label: "Links"
    label: "Link URL"
    type: string
    sql: mlnk.value:url::varchar ;;
  }

  measure: count {
    label: "Number of Links"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__measures.name,
      label,
      url,
      icon_url
    ]
  }
}
