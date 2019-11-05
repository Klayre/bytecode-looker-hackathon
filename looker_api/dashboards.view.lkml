view: dashboards {
  view_label: "Dashboards"
  sql_table_name: LOOKER.DASHBOARDS ;;
  drill_fields: [detail*]

  dimension: id {
    group_label: "Keys/IDs"
    label: "Dashboard ID"
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
    group_label: "Keys/IDs"
    label: "Content Metadata ID"
    type: string
    sql: ${TABLE}.CONTENT_METADATA_ID ;;
  }

  dimension: description {
    label: "Dashboard Description"
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: folder {
    label: "Folder JSON"
    type: string
    sql: ${TABLE}.FOLDER ;;
    hidden: yes
  }

  dimension: folder_id {
    group_label: "Keys/IDs"
    label: "Folder ID"
    type: string
    sql: ${folder}:id ;;
  }

  dimension: hidden {
    label: "Is Hidden"
    type: yesno
    sql: ${TABLE}.HIDDEN ;;
  }

  dimension: query_timezone {
    label: "Query Timezone"
    type: string
    sql: ${TABLE}.QUERY_TIMEZONE ;;
  }

  dimension: readonly {
    label: "Is Read Only"
    type: yesno
    sql: ${TABLE}.READONLY ;;
  }

  dimension: refresh_interval {
    label: "Refresh Interval"
    type: string
    sql: ${TABLE}.REFRESH_INTERVAL ;;
  }

  dimension: refresh_interval_to_i {
    label: "Refresh Interval to i"
    type: number
    sql: ${TABLE}.REFRESH_INTERVAL_TO_I ;;
    hidden: yes
  }

  dimension: short_url {
    label: "Short URL"
    type: string
    sql: '/dashboards/' || ${id} ;;
  }

  dimension: space {
    label: "Space JSON"
    type: string
    sql: ${TABLE}.SPACE ;;
    hidden: yes
  }

  dimension: space_id {
    group_label: "Keys/IDs"
    label: "Space ID"
    type: string
    sql: ${space}:id ;;
  }

  dimension: space_name {
    label: "Space Name"
    type: string
    sql: ${space}:name ;;
  }

  dimension: title {
    label: "Dashboard Title"
    type: string
    sql: ${TABLE}.TITLE ;;
    link: {
      label: "Open Dashboard"
      url: "{{ short_url._value }}"
    }
  }

  dimension: list_title {
    label: "List Title Block"
    type: string
    sql: ${title} ;;
    html: <div>
      <div style="color: #1c2027;font-size: 14px;"><a href="/dashboards/{{ dashboards.id._value }}">{{value}}</a></div>
      <div style="color:#7f7977"><a href="/dashboards/{{ dashboards.id._value }}">{{dashboards.description._value }}</a></div>
    <div style="color: #7f7977;font-size: 12px;"><a href="/dashboards/{{ dashboards.id._value }}">{{ content_views.total_views._rendered_value }} Views, Created by {{ create_user.display_name._value }}</a></div>
    </div>;;
  }

  dimension: thumbnail {
    label: "Dashboard Thumbnail"
    type: string
    sql: ${id} ;;
    html: <a href="/folders/{{ value }}">
      <img style="width:83px" src="https://bytecode.looker.com/api/internal/vector_thumbnail/dashboard/{{value}}" />
      </a><br /><br />;;
  }

  dimension: user_id {
    group_label: "Keys/IDs"
    label: "User ID"
    type: string
    sql: ${TABLE}.USER_ID ;;
  }

  # MEASURES
  measure: count {
    label: "Number of Dashboards"
    type: count
    drill_fields: [detail*]
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      title,
      description,
      space_id,
      space_name,
      content_metadata.id,
      content_metadata.name,
      users.id,
      users.display_name,
      users.first_name,
      content_metadata.count,
      dashboard_elements.count,
      dashboard_filters.count,
      dashboard_layouts.count
    ]
  }
}
