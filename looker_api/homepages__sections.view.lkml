view: homepages__sections {
  view_label: "Homepages"
  # sql: select  hp.id,
  #                 hp.title,
  #                 hp.homepage_sections::variant as homepage_sections,
  #                 hps.value::variant as homepage_section,
  #                 hps.value:created_at::datetime as created_at,
  #                 hps.value:hopepage_id::varchar as homepage_id,
  #                 hps.value:homepage_items::variant as homepage_items,
  #                 hps.value:id::varchar as id,
  #                 hps.value:item_order::variant as item_order,
  #                 hps.value:title::varchar as title,
  #                 hps.value:updated_at::datetime as updated_at
  #         from looker.homepages hp
  #         , lateral flatten(input => hp.homepage_sections) hps ;;

  dimension: id {
    group_label: "Keys/IDs"
    label: "Homepage Section ID"
    type: string
    primary_key: yes
    sql: hps.value:id::varchar ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: hps.value:created_at::datetime ;;
  }

  dimension: homepage_id {
    group_label: "Keys/IDs"
    label: "Homepage ID"
    type: string
    sql: hps.value:hopepage_id::varchar ;;
  }

  dimension: homepage_items {
    label: "Homepage Items JSON"
    type: string
    sql: hps.value:homepage_items::variant ;;
    hidden: yes
  }

  dimension: item_order {
    label: "Item Order JSON"
    type: string
    sql: hps.value:item_order::variant ;;
    hidden: yes
  }

  dimension: title {
    label: "Homepage Section Title"
    type: string
    sql: hps.value:title::varchar ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: hps.value:updated_at::datetime ;;
  }

  measure: count {
    label: "Number of Homepage Sections"
    type: count
  }

  set: detail {
    fields: [
      id,
      title,
      homepages.id,
      homepages.title
    ]
  }
}
