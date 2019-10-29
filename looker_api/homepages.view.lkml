view: homepages {
  view_label: "Homepages"
  sql_table_name: LOOKER.HOMEPAGES ;;
  drill_fields: [detail*]

  dimension: id {
    group_item_label: "Keys/IDs"
    label: "Homepage ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}._SDC_BATCHED_AT ;;
    hidden: yes
  }

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}._SDC_EXTRACTED_AT ;;
    hidden: yes
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}._SDC_RECEIVED_AT ;;
    hidden: yes
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._SDC_SEQUENCE ;;
    hidden: yes
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._SDC_TABLE_VERSION ;;
    hidden: yes
  }

  dimension: content_metadata_id {
    group_item_label: "Keys/IDs"
    label: "Content Metadata ID"
    type: string
    # hidden: yes
    sql: ${TABLE}.CONTENT_METADATA_ID ;;
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
    sql: ${TABLE}.CREATED_AT ;;
  }

  dimension: description {
    label: "Homepage Description"
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: homepage_sections {
    label: "Homepage Sections JSON"
    type: string
    sql: ${TABLE}.HOMEPAGE_SECTIONS ;;
    hidden: yes
  }

  dimension: section_order {
    label: "Section Order JSON"
    type: string
    sql: ${TABLE}.SECTION_ORDER ;;
    hidden: yes
  }

  dimension: short_url {
    label: "Short URL"
    type: string
    sql: '/browse/boards/' || ${id} ;;
  }

  dimension: title {
    label: "Homepage Title"
    type: string
    sql: ${TABLE}.TITLE ;;
    link: {
      label: "Open in Looker"
      url: "{{ short_url._value }}"
    }
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
    sql: ${TABLE}.UPDATED_AT ;;
  }

  dimension: user_id {
    group_item_label: "Keys/IDs"
    label: "User ID"
    type: string
    sql: ${TABLE}.USER_ID ;;
  }

  measure: count {
    label: "Number of Homepages"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      title,
      content_metadata.id,
      content_metadata.name,
      users.id,
      users.display_name,
      users.first_name
    ]
  }
}
