view: dashboard_layouts_components {
  view_label: "Dashboard Layouts"
#     sql:  select  dl.id as layout_id,
#                 dl.type as layout_type,
#                 dl.dashboard_id,
#                 dl.dashboard_title,
#                 dlc.value:"column"::int as "column",
#                 dlc.value:dashboard_element_id::varchar as dashboard_element_id,
#                 dlc.value:dashboard_layout_id::varchar as dashboard_layout_id,
#                 dlc.value:deleted::varchar as deleted,
#                 dlc.value:element_title::varchar as element_title,
#                 dlc.value:element_title_hidden::varchar as element_title_hidden,
#                 dlc.value:height::int as height,
#                 dlc.value:id::varchar as id,
#                 dlc.value:"row"::int as "row",
#                 dlc.value:vis_type::varchar as vis_type,
#                 dlc.value:width::int as width
#         from looker.dashboard_layouts dl
#         , lateral flatten(input => dl.dashboard_layout_components) dlc ;;

  dimension: id {
    group_label: "Keys/IDs"
    label: "Datagroup Layout Component ID"
    type: string
    primary_key: yes
    sql: dlc.value:id::varchar ;;
  }

  dimension: column {
    label: "Column"
    type: number
    sql: dlc.value:"column"::int  ;;
  }

  dimension: dashboard_element_id {
    group_label: "Keys/IDs"
    label: "Datagroup Element ID"
    type: string
    sql: dlc.value:dashboard_element_id::varchar ;;
  }

  dimension: dashboard_layout_id {
    group_label: "Keys/IDs"
    label: "Datagroup Layout ID"
    type: string
    sql: dlc.value:dashboard_layout_id::varchar ;;
  }

  dimension: deleted {
    label: "Is Deleted"
    type: yesno
    sql: dlc.value:deleted::varchar  ;;
  }

  dimension: element_title {
    label: "Element Title"
    type: string
    sql: dlc.value:element_title::varchar  ;;
  }

  dimension: element_title_hidden {
    label: "Is Element Title Hidden"
    type: yesno
    sql: dlc.value:element_title_hidden::varchar  ;;
  }

  dimension: height {
    label: "Height"
    type: number
    sql: dlc.value:height::int  ;;
  }

  dimension: row {
    label: "Row"
    type: number
    sql: dlc.value:"row"::int  ;;
  }

  dimension: vis_type {
    label: "Visualization Type"
    type: string
    sql: dlc.value:vis_type::varchar  ;;
  }

  dimension: width {
    label: "Width"
    type: number
    sql: dlc.value:width::int  ;;
  }


  set: detail {
    fields: [
      element_title,
      element_title_hidden,
      vis_type,
      row,
      column,
      height,
      width,
      dashboard_layout.dashboard_title,
      dashboard_layout.type
    ]
  }

}
