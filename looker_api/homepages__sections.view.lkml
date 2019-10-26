view: homepages__sections {
  view_label: "Homepages"
  derived_table: {
    sql: select  hp.id as hp_id,
                    hp.title as homepage_title,
                    hps.value::variant as homepage_section,
                    hps.value:created_at::datetime as created_at,
                    hps.value:hopepage_id::varchar as homepage_id,
                    hps.value:homepage_items::variant as homepage_items,
                    hps.value:id::varchar as id,
                    hps.value:item_order::variant as item_order,
                    hps.value:title::varchar as title,
                    hps.value:updated_at::datetime as updated_at
            from looker.homepages hp
            , lateral flatten(input => hp.homepage_sections) hps ;;
  }

  dimension: id {
    group_label: "Keys/IDs"
    label: "Homepage Section ID"
    type: string
    primary_key: yes
    sql: ${TABLE}.id  ;;
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: homepage_id {
    group_label: "Keys/IDs"
    label: "Homepage ID"
    type: string
    sql: ${TABLE}.homepage_id ;;
  }

  dimension: homepage_title {
    label: "Homepage Title"
    type: string
    sql: ${TABLE}.homepage_title ;;
    hidden: yes
  }

  dimension: homepage_items {
    label: "Homepage Items JSON"
    type: string
    sql: ${TABLE}.homepage_items ;;
    hidden: yes
  }

  dimension: item_order {
    label: "Item Order JSON"
    type: string
    sql: ${TABLE}.item_order ;;
    hidden: yes
  }

  dimension: title {
    label: "Homepage Section Title"
    type: string
    sql: ${TABLE}.title ;;
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
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    label: "Number of Homepage Sections"
    type: count
  }

  set: detail {
    fields: [
      id,
      title,
      homepage_id,
      homepage_title
    ]
  }
}
