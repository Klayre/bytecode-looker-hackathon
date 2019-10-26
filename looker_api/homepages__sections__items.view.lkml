view: homepages__sections__items {
  view_label: "Homepages"
  # sql: select  hp.id,
  #                 hp.title as homepage_title,
  #                 hps.value:id::varchar as homepage_section_id,
  #                 hps.value:title::varchar as homepage_section_title,
  #                 hps.value:homepage_items::variant as homepage_items,
  #                 hpsi.value::variant as homepage_item,
  #                 hpsi.value:content_created_by::varchar as content_created_by,
  #                 hpsi.value:content_metadata_id::varchar as content_metadata_id,
  #                 hpsi.value:dashboard_id::varchar as dashboard_id,
  #                 hpsi.value:favorite_count::int as favorite_count,
  #                 hpsi.value:homepage_section_id::varchar as homepage_section_id,
  #                 hpsi.value:id::varchar as id,
  #                 hpsi.value:image_url::varchar as image_url,
  #                 hpsi.value:location::varchar as location,
  #                 hpsi.value:look_id::varchar as look_id,
  #                 hpsi.value:title::varchar as title,
  #                 hpsi.value:url::varchar as url,
  #                 hpsi.value:view_count::int as view_count
  #         from looker.homepages hp
  #         , lateral flatten(input => hp.homepage_sections) hps
  #         , lateral flatten(input => hps.value:homepage_items) hpsi ;;

  dimension: id {
    group_label: "Keys/IDs"
    label: "Homepage Item ID"
    type: string
    primary_key: yes
    sql: hpsi.value:id::varchar ;;
  }

  dimension: content_metadata_id {
    group_label: "Keys/IDs"
    label: "Content Metadata ID"
    type: string
    sql: hpsi.value:content_metadata_id::varchar ;;
  }

  dimension: content_created_by {
    label: "Content Created By"
    type: string
    sql: hpsi.value:content_created_by::varchar ;;
  }

  dimension: homepage_section_id {
    group_label: "Keys/IDs"
    label: "Homepage Section ID"
    type: string
    sql: hpsi.value:hopepage_section_id::varchar ;;
  }

  dimension: dashboard_id {
    group_label: "Keys/IDs"
    label: "Dashboard ID"
    type: string
    sql: hpsi.value:dashboard_id::varchar ;;
  }

  dimension: favorite_count {
    label: "Favorite Count"
    type: number
    sql: hpsi.value:favorite_count::varchar ;;
  }

  dimension: image_url {
    label: "Image URL"
    type: string
    sql: hps.value:image_url::varchar ;;
  }

  dimension: location {
    label: "Location"
    type: string
    sql: hps.value:location::varchar ;;
  }

  dimension: look_id {
    group_label: "Keys/IDs"
    label: "Look ID"
    type: string
    sql: hpsi.value:look_id::varchar ;;
  }

  dimension: title {
    label: "Homepage Item Title"
    type: string
    sql: hps.value:title::varchar ;;
  }

  dimension: url {
    label: "URL"
    type: string
    sql: hps.value:url::varchar ;;
  }

  dimension: view_count {
    label: "View Count"
    type: number
    sql: hpsi.value:view_count::varchar ;;
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
      homepages__sections.id,
      homepages__sections.title,
      homepages.id,
      homepages.title,
      content_metadata.id,
      content_metadata.name,
      content_metadata.content_type,
      dashboards.id,
      dashboards.name,
      looks.id,
      looks.name
    ]
  }
}
