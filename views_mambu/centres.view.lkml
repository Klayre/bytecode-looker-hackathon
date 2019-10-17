# JSON Views

# Centre Addresses - JSON List Array
# SQL:
# select  id as centre_id,
#         addresses as centre_addresses_json,
#         ca.value:city::varchar as centre_address_city,
#         ca.value:country::varchar as centre_address_country,
#         ca.value:encoded_key::varchar as centre_address_encoded_key,
#         ca.value:index_in_list::int as centre_address_index_in_list,
#         ca.value:line1::varchar as centre_address_line_1,
#         ca.value:line2::varchar as centre_address_line_2,
#         ca.value:parent_key::varchar as centre_address_parent_key,
#         ca.value:postcode::varchar as centre_address_postcode,
#         ca.value:region::varchar as centre_address_region
# from mambu_beta.centres
# , lateral flatten(input => mambu_beta.centres.addresses) ca ;
view: centre_addresses {
  view_label: "Centres"

  dimension: centre_address_key {
    group_label: "Centre Addresses"
    label: "Centre Address Key"
    type: string
    primary_key: yes
    sql: ca.value:encoded_key::varchar ;;
  }

  dimension: centre_address_city {
    group_label: "Centre Addresses"
    label: "Centre Address City"
    type: string
    sql: ca.value:city::varchar ;;
  }

  dimension: centre_address_country {
    group_label: "Centre Addresses"
    label: "Centre Address Country"
    type: string
    sql: ca.value:country::varchar ;;
  }

  dimension: centre_address_index {
    group_label: "Centre Addresses"
    label: "Centre Address Index"
    type: number
    value_format_name: decimal_0
    sql: ca.value:index_in_list::int ;;
  }

  dimension: centre_address_line_1 {
    group_label: "Centre Addresses"
    label: "Centre Address Line 1"
    type: string
    sql: ca.value:line1::varchar ;;
  }

  dimension: centre_address_line_2 {
    group_label: "Centre Addresses"
    label: "Centre Address Line 2"
    type: string
    sql: ca.value:line2::varchar ;;
  }

  dimension: centre_address_parent_key {
    group_label: "Centre Addresses"
    label: "Centre Address Parent Key"
    type: string
    sql: ca.value:parent_key::varchar ;;
  }

  dimension: centre_address_postcode {
    group_label: "Centre Addresses"
    label: "Centre Address Postcode"
    type: string
    sql: ca.value:postcode::varchar ;;
  }

  dimension: centre_address_region {
    group_label: "Centre Addresses"
    label: "Centre Address Region"
    type: string
    sql: ca.value:region::varchar ;;
  }

  measure: count {
    label: "Number of Centre Addresses"
    type: count
  }
}


# Centre Custom Field Sets - JSON List Array
# SQL:
# select  id as centre_id,
#         custom_field_sets as custom_field_set_json,
#         ccfs.value:custom_field_set_id::varchar as custom_field_set_id,
#         ccfs.value:custom_field_values::variant as custom_field_values_json
# from mambu_beta.centres
# , lateral flatten(input => mambu_beta.centres.custom_field_sets) ccfs ;
view: centre_custom_field_sets {
  view_label: "Centres"

  dimension: centre_custom_field_set_pk {
    group_label: "Centre Custom Fields"
    label: "Centre Custom Field Set PK"
    type: string
    primary_key: yes
    hidden: yes
    sql: ${centres.id} || '-' || ${centre_custom_field_set_id} ;;
  }

  dimension: centre_custom_field_set_id {
    group_label: "Centre Custom Fields"
    label: "Centre Custom Field Set ID"
    type: string
    sql: ccfs.value:custom_field_set_id::varchar ;;
  }

  dimension: centre_custom_field_values_json {
    group_label: "Centre Custom Fields"
    label: "Centre Custom Field Values JSON"
    type: string
    hidden: yes
    sql: ccfs.value:custom_field_values::variant ;;
  }

  measure: count {
    label: "Number of Centre Custom Field Sets"
    type: count
  }
}


# Centre Custom Field Sets - JSON List Array
# SQL:
# select  id as centre_id,
#         custom_field_sets as custom_field_set_json,
#         ccfs.value:custom_field_set_id::varchar as custom_field_set_id,
#         ccfs.value:custom_field_values::variant as custom_field_values_json,
#         ccfv.value:custom_field_id::varchar as custom_field_id,
#         ccfv.value:custom_field_value::varchar as custom_field_value
# from mambu_beta.centres
# , lateral flatten(input => mambu_beta.centres.custom_field_sets) ccfs
# , lateral flatten(input => ccfs.value:custom_field_values) ccfv ;
view: centre_custom_field_values {
  view_label: "Centres"

  dimension: centre_custom_field_pk {
    group_label: "Centre Custom Fields"
    label: "Centre Custom Field PK"
    type: string
    primary_key: yes
    hidden: yes
    sql: ${centres.id} || '-' || ${centre_custom_field_sets.centre_custom_field_set_id} || '-' ||
      ${centre_custom_field_id} ;;
  }

  dimension: centre_custom_field_id {
    group_label: "Centre Custom Fields"
    label: "Centre Custom Field ID"
    type: string
    sql: ccfv.value:custom_field_id::varchar ;;
  }

  dimension: centre_custom_field_value {
    group_label: "Centre Custom Fields"
    label: "Centre Custom Field Value"
    type: string
    sql: ccfv.value:custom_field_value::varchar ;;
  }

  measure: count {
    label: "Number of Centre Custom Field Values"
    type: count
  }
}


# Centres - Main View
view: centres {
  view_label: "Centres"
  sql_table_name: MAMBU_BETA.CENTRES ;;

  dimension: id {
    group_label: "Keys/IDs"
    label: "Centre ID"
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

  dimension: addresses {
    label: "Addresses JSON"
    type: string
    hidden: yes
    sql: ${TABLE}.ADDRESSES ;;
  }

  dimension: assigned_branch_key {
    group_label: "Keys/IDs"
    label: "Assigned Branch Key"
    type: string
    sql: ${TABLE}.ASSIGNED_BRANCH_KEY ;;
  }

  dimension_group: creation {
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
    sql: ${TABLE}.CREATION_DATE ;;
  }

  dimension: custom_field_sets {
    label: "Custom Field Sets JSON"
    type: string
    hidden: yes
    sql: ${TABLE}.CUSTOM_FIELD_SETS ;;
  }

  dimension: encoded_key {
    group_label: "Keys/IDs"
    label: "Centre Key"
    type: string
    sql: ${TABLE}.ENCODED_KEY ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.LAST_MODIFIED_DATE ;;
  }

  dimension: meeting_day {
    type: string
    sql: ${TABLE}.MEETING_DAY ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
  }

  measure: count {
    type: count
  }
}
