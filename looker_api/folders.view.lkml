view: folders {
  view_label: "Folders"
  sql_table_name: LOOKER.FOLDERS ;;
  drill_fields: [detail*]

  dimension: id {
    group_label: "Keys/IDs"
    label: "Folder ID"
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

  dimension: child_count {
    label: "Child Count"
    type: number
    sql: ${TABLE}.CHILD_COUNT ;;
  }

  dimension: content_metadata_id {
    group_label: "Keys/IDs"
    label: "Content Metadata ID"
    type: string
    sql: ${TABLE}.CONTENT_METADATA_ID ;;
  }

  dimension: creator_id {
    group_label: "Keys/IDs"
    label: "Creator ID"
    type: string
    sql: ${TABLE}.CREATOR_ID ;;
  }

  dimension: is_embed {
    group_label: "Indicators"
    label: "Is Embed"
    type: yesno
    sql: ${TABLE}.IS_EMBED ;;
  }

  dimension: is_embed_shared_root {
    group_label: "Indicators"
    label: "Is Embed Shared Root"
    type: yesno
    sql: ${TABLE}.IS_EMBED_SHARED_ROOT ;;
  }

  dimension: is_embed_users_root {
    group_label: "Indicators"
    label: "Is Embed Users Root"
    type: yesno
    sql: ${TABLE}.IS_EMBED_USERS_ROOT ;;
  }

  dimension: is_personal {
    group_label: "Indicators"
    label: "Is Personal"
    type: yesno
    sql: ${TABLE}.IS_PERSONAL ;;
  }

  dimension: is_personal_descendant {
    group_label: "Indicators"
    label: "Is Personal Descendant"
    type: yesno
    sql: ${TABLE}.IS_PERSONAL_DESCENDANT ;;
  }

  dimension: is_shared_root {
    group_label: "Indicators"
    label: "Is Shared Root"
    type: yesno
    sql: ${TABLE}.IS_SHARED_ROOT ;;
  }

  dimension: is_users_root {
    group_label: "Indicators"
    label: "Is Users Root"
    type: yesno
    sql: ${TABLE}.IS_USERS_ROOT ;;
  }

  dimension: name {
    label: "Folder Name"
    type: string
    sql: ${TABLE}.NAME ;;
    link: {
      label: "Drill to Folder Contents"
      url: "/dashboards/@{folders_dashboard_id}?Folder={{ value }}"
    }
    link: {
      label: "Open in Looker"
      url: "{{ short_url._value }}"
    }
  }

  dimension: parent_id {
    group_label: "Keys/IDs"
    label: "Parent Folder ID"
    type: string
    sql: ${TABLE}.PARENT_ID ;;
  }

  dimension: short_url {
    label: "Short URL"
    type: string
    sql: '/folders/' || ${id} ;;
  }

  measure: count {
    label: "Number of Folders"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      name,
      parent.name
    ]
  }
}
