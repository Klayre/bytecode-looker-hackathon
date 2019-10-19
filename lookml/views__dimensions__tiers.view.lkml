view: views__dimensions__tiers {
  view_label: "Dimensions"
#     sql: select  v.sha as view_sha,
#                   v.path as view_path,
#                   v.name as view_name,
#                   v.dimensions::variant as dimensions,
#                   d.value::variant as dimension,
#                   d.value:name::varchar as dimension_name,
#                   d.value:tiers::variant as tiers,
#                   dtier.value::varchar as tier
#           from lookml.views v
#           , lateral flatten(input => v.dimensions) d
#           , lateral flatten(input => d.value:tiers) dtier ;;

  dimension: tiers_pk {
    group_label: "Tiers"
    label: "Tiers PK"
    type: string
    primary_key: yes
    sql: ${views__dimensions.dimension_pk} || '-' || ${tier}  ;;
    hidden: yes
  }

  dimension: tier {
    group_label: "Tiers"
    label: "Tier"
    type: string
    sql: dtier.value::varchar ;;
  }

  measure: count {
    label: "Number of Tiers"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_files.view_file_name,
      views.path,
      views.name,
      views__dimensions.name,
      tier
    ]
  }
}
