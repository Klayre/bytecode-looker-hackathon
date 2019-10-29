view: homepages__items {
  view_label: "Homepages"
  derived_table: {
    sql: select  hp.id as homepage_id,
                    hp.title as homepage_title,
                    hps.value:id::varchar as homepage_section_id,
                    hps.value:title::varchar as homepage_section_title,
                    hps.value:homepage_items::variant as homepage_items,
                    hpsi.value::variant as homepage_item,
                    hpsi.value:content_created_by::varchar as content_created_by,
                    hpsi.value:content_metadata_id::varchar as content_metadata_id,
                    hpsi.value:dashboard_id::varchar as dashboard_id,
                    hpsi.value:favorite_count::int as favorite_count,
                    hpsi.value:homepage_section_id::varchar as homepage_section_id,
                    hpsi.value:id::varchar as id,
                    hpsi.value:image_url::varchar as image_url,
                    hpsi.value:location::varchar as location,
                    hpsi.value:look_id::varchar as look_id,
                    hpsi.value:title::varchar as title,
                    hpsi.value:url::varchar as url,
                    hpsi.value:view_count::int as view_count
            from looker.homepages hp
            , lateral flatten(input => hp.homepage_sections) hps
            , lateral flatten(input => hps.value:homepage_items) hpsi ;;
  }

  dimension: id {
    group_label: "Keys/IDs"
    label: "Homepage Item ID"
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: content_metadata_id {
    group_label: "Keys/IDs"
    label: "Content Metadata ID"
    type: string
    sql: ${TABLE}.content_metadata_id ;;
  }

  dimension: content_created_by {
    label: "Content Created By"
    type: string
    sql: ${TABLE}.content_created_by ;;
  }

  dimension: homepage_section_id {
    group_label: "Keys/IDs"
    label: "Homepage Section ID"
    type: string
    sql: ${TABLE}.homepage_section_id ;;
  }

  dimension: homepage_id {
    group_label: "Keys/IDs"
    label: "Homepage ID"
    type: string
    sql: ${TABLE}.homepage_id ;;
  }

  dimension: dashboard_id {
    group_label: "Keys/IDs"
    label: "Dashboard ID"
    type: string
    sql: ${TABLE}.dashboard_id ;;
  }

  dimension: favorite_count {
    label: "Favorite Count"
    type: number
    sql: ${TABLE}.favorite_count ;;
  }

  dimension: image_url {
    label: "Image URL"
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: location {
    label: "Location"
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: look_id {
    group_label: "Keys/IDs"
    label: "Look ID"
    type: string
    sql: ${TABLE}.look_id ;;
  }

  dimension: title {
    label: "Homepage Item Title"
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: url {
    label: "URL"
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: view_count {
    label: "View Count"
    type: number
    sql: ${TABLE}.view_count ;;
  }

  measure: count {
    label: "Number of Homepage Items"
    type: count
  }

  measure: total_favorites {
    label: "Total Favorites"
    type: sum
    sql: ${favorite_count} ;;
  }

  measure: total_views {
    label: "Total Views"
    type: sum
    sql: ${view_count} ;;
  }

  set: detail {
    fields: [
      id,
      title,
      homepage_section_id,
      homepages__sections.title,
      homepage_id,
      homepages.title,
      content_metadata_id,
      content_metadata.name,
      content_metadata.content_type,
      dashboard_id,
      dashboards.name,
      look_id,
      looks.name
    ]
  }
}
