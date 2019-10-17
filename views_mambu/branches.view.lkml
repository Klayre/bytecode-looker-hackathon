# JSON Views

# Branch Addresses - JSON List Array
# SQL:
# select  id as branch_id,
#         addresses as branch_addresses_json,
#         ba.value:city::varchar as branch_address_city,
#         ba.value:country::varchar as branch_address_country,
#         ba.value:encoded_key::varchar as branch_address_encoded_key,
#         ba.value:index_in_list::int as branch_address_index_in_list,
#         ba.value:line1::varchar as branch_address_line_1,
#         ba.value:line2::varchar as branch_address_line_2,
#         ba.value:parent_key::varchar as branch_address_parent_key,
#         ba.value:postcode::varchar as branch_address_postcode,
#         ba.value:region::varchar as branch_address_region
# from mambu_beta.branches
# , lateral flatten(input => mambu_beta.branches.addresses) ba ;
view: branch_addresses {
  view_label: "Branches"

  dimension: branch_address_key {
    group_label: "Branch Addresses"
    label: "Branch Address Key"
    type: string
    primary_key: yes
    sql: ba.value:encoded_key::varchar ;;
  }

  dimension: branch_address_city {
    group_label: "Branch Addresses"
    label: "Branch Address City"
    type: string
    sql: ba.value:city::varchar ;;
  }

  dimension: branch_address_country {
    group_label: "Branch Addresses"
    label: "Branch Address Country"
    type: string
    sql: ba.value:country::varchar ;;
  }

  dimension: branch_address_index {
    group_label: "Branch Addresses"
    label: "Branch Address Index"
    type: number
    value_format_name: decimal_0
    sql: ba.value:index_in_list::int ;;
  }

  dimension: branch_address_line_1 {
    group_label: "Branch Addresses"
    label: "Branch Address Line 1"
    type: string
    sql: ba.value:line1::varchar ;;
  }

  dimension: branch_address_line_2 {
    group_label: "Branch Addresses"
    label: "Branch Address Line 2"
    type: string
    sql: ba.value:line2::varchar ;;
  }

  dimension: branch_address_parent_key {
    group_label: "Branch Addresses"
    label: "Branch Address Parent Key"
    type: string
    sql: ba.value:parent_key::varchar ;;
  }

  dimension: branch_address_postcode {
    group_label: "Branch Addresses"
    label: "Branch Address Postcode"
    type: string
    sql: ba.value:postcode::varchar ;;
  }

  dimension: branch_address_region {
    group_label: "Branch Addresses"
    label: "Branch Address Region"
    type: string
    sql: ba.value:region::varchar ;;
  }

  measure: count {
    label: "Number of Branch Addresses"
    type: count
  }
}


# Branch Holidays - JSON List Array
# SQL:
# select  id as branch_id,
#         branch_holidays as branch_holiday_json,
#         bh.value:creation_date::datetime as creation_date,
#         bh.value:date::date as branch_holiday_date,
#         bh.value:encoded_key::varchar as branch_holiday_key,
#         bh.value:name::varchar as branch_holiday_name
# from mambu_beta.branches
# , lateral flatten(input => mambu_beta.branches.branch_holidays) bh;
view: branch_holidays {
  view_label: "Branches"

  dimension: branch_holiday_key {
    group_label: "Branch Holidays"
    label: "Branch Holiday Key"
    type: string
    primary_key: yes
    sql: bh.value:encoded_key::varchar ;;
  }

  dimension_group: creation {
    type: time
    datatype: datetime
    convert_tz: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: bh.value:creation_date::datetime ;;
    hidden: yes
  }

  dimension: branch_holiday_date {
    group_label: "Branch Holidays"
    label: "Branch Holiday Date"
    type: date
    convert_tz: no
    sql: bh.value:date::date ;;
  }

  dimension: branch_holiday_name {
    group_label: "Branch Holidays"
    label: "Branch Holiday Name"
    type: string
    sql: bh.value:name::varchar ;;
  }

  measure: count {
    label: "Number of Branch Holidays"
    type: count
  }
}


# Branch Custom Field Sets - JSON List Array
# SQL:
# select  id as branch_id,
#         custom_field_sets as custom_field_set_json,
#         bcfs.value:custom_field_set_id::varchar as custom_field_set_id,
#         bcfs.value:custom_field_values::variant as custom_field_values_json
# from mambu_beta.branches
# , lateral flatten(input => mambu_beta.branches.custom_field_sets) bcfs ;
view: branch_custom_field_sets {
  view_label: "Branches"

  dimension: branch_custom_field_set_pk {
    group_label: "Branch Custom Fields"
    label: "Branch Custom Field Set PK"
    type: string
    primary_key: yes
    hidden: yes
    sql: ${branches.id} || '-' || ${branch_custom_field_set_id} ;;
  }

  dimension: branch_custom_field_set_id {
    group_label: "Branch Custom Fields"
    label: "Branch Custom Field Set ID"
    type: string
    sql: bcfs.value:custom_field_set_id::varchar ;;
  }

  dimension: branch_custom_field_values_json {
    group_label: "Branch Custom Fields"
    label: "Branch Custom Field Values JSON"
    type: string
    hidden: yes
    sql: bcfs.value:custom_field_values::variant ;;
  }

  measure: count {
    label: "Number of Branch Custom Field Sets"
    type: count
  }
}


# Branch Custom Field Sets - JSON List Array
# SQL:
# select  id as branch_id,
#         custom_field_sets as custom_field_set_json,
#         bcfs.value:custom_field_set_id::varchar as custom_field_set_id,
#         bcfs.value:custom_field_values::variant as custom_field_values_json,
#         bcfv.value:custom_field_id::varchar as custom_field_id,
#         bcfv.value:custom_field_value::varchar as custom_field_value
# from mambu_beta.branches
# , lateral flatten(input => mambu_beta.branches.custom_field_sets) bcfs
# , lateral flatten(input => bcfs.value:custom_field_values) bcfv ;
view: branch_custom_field_values {
  view_label: "Branches"

  dimension: branch_custom_field_pk {
    group_label: "Branch Custom Fields"
    label: "Branch Custom Field PK"
    type: string
    primary_key: yes
    hidden: yes
    sql: ${branches.id} || '-' || ${branch_custom_field_sets.branch_custom_field_set_id} || '-' ||
           ${branch_custom_field_id} ;;
  }

  dimension: branch_custom_field_id {
    group_label: "Branch Custom Fields"
    label: "Branch Custom Field ID"
    type: string
    sql: bcfv.value:custom_field_id::varchar ;;
  }

  dimension: branch_custom_field_value {
    group_label: "Branch Custom Fields"
    label: "Branch Custom Field Value"
    type: string
    sql: bcfv.value:custom_field_value::varchar ;;
  }

  measure: count {
    label: "Number of Branch Custom Field Values"
    type: count
  }
}


# Branches - Main Table
view: branches {
  view_label: "Branches"
  sql_table_name: MAMBU_BETA.BRANCHES ;;

  dimension: id {
    group_label: "Keys/IDs"
    label: "Branch ID"
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

  # JSON - flattened in related view
  dimension: branch_holidays {
    label: "Branch Holidays JSON"
    type: string
    sql: ${TABLE}.BRANCH_HOLIDAYS ;;
    hidden: yes
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

  dimension: email_address {
    label: "Branch Email"
    type: string
    sql: ${TABLE}.EMAIL_ADDRESS ;;
  }

  dimension: encoded_key {
    group_label: "Keys/IDs"
    label: "Branch Key"
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

  dimension: name {
    label: "Branch Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: notes {
    label: "Branch Notes"
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: phone_number {
    label: "Branch Phone"
    type: string
    sql: ${TABLE}.PHONE_NUMBER ;;
  }

  dimension: state {
    label: "Branch Status"
    type: string
    sql: ${TABLE}.STATE ;;
  }

  # MEASURES
  measure: count {
    label: "Number of Branches"
    type: count
  }

  set: detail {
    fields: [
      id,
      name,
      state
    ]
  }
}
