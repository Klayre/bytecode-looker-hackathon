view: views__dimensions__links {
  view_label: "Dimensions"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimensions::variant as dimensions,
#                   d.value::variant as dimension,
#                   d.value:name::varchar as dimension_name,
#                   d.value:links::variant as links,
#                   dlnk.value::varchar as link,
#                   dlnk.value:icon_url::varchar as icon_url,
#                   dlnk.value:label::varchar as label,
#                   dlnk.value:url::varchar as url
#           from lookml.views v
#           , lateral flatten(input => v.dimensions) d
#           , lateral flatten(input => d.value:links) dlnk ;;

  dimension: links_pk {
    group_label: "Links"
    label: "Links PK"
    type: string
    primary_key: yes
    sql: MD5(${views__dimensions.dimension_pk} || '-' || ${label} || '-' || ${url}) ;;
    hidden: yes
  }

  dimension: icon_url {
    group_label: "Links"
    label: "Icon URL"
    type: string
    sql: dlnk.value:icon_url::varchar ;;
  }

  dimension: label {
    group_label: "Links"
    label: "Link Label"
    type: string
    sql: dlnk.value:label::varchar ;;
  }

  dimension: url {
    group_label: "Links"
    label: "Link URL"
    type: string
    sql: dlnk.value:url::varchar ;;
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
      views__dimensions.name,
      label,
      url,
      icon_url
    ]
  }
}
