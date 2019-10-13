# Client Addresses - JSON List Array
# SQL:
# select  id as client_id,
#         addresses as client_addresses_json,
#         cla.value:city::varchar as client_address_city,
#         cla.value:country::varchar as client_address_country,
#         cla.value:encoded_key::varchar as client_address_encoded_key,
#         cla.value:index_in_list::int as client_address_index_in_list,
#         cla.value:line1::varchar as client_address_line_1,
#         cla.value:line2::varchar as client_address_line_2,
#         cla.value:parent_key::varchar as client_address_parent_key,
#         cla.value:postcode::varchar as client_address_postcode,
#         cla.value:region::varchar as client_address_region
# from mambu_beta.clients
# , lateral flatten(input => mambu_beta.clients.addresses) ca ;
view: client_addresses {
  view_label: "Clients"

  dimension: client_address_key {
    group_label: "Client Addresses"
    label: "Client Address Key"
    type: string
    primary_key: yes
    sql: cla.value:encoded_key::varchar ;;
  }

  dimension: client_address_city {
    group_label: "Client Addresses"
    label: "Client Address City"
    type: string
    sql: cla.value:city::varchar ;;
  }

  dimension: client_address_country {
    group_label: "Client Addresses"
    label: "Client Address Country"
    type: string
    sql: cla.value:country::varchar ;;
  }

  dimension: client_address_index {
    group_label: "Client Addresses"
    label: "Client Address Index"
    type: number
    value_format_name: decimal_0
    sql: cla.value:index_in_list::int ;;
  }

  dimension: client_address_line_1 {
    group_label: "Client Addresses"
    label: "Client Address Line 1"
    type: string
    sql: cla.value:line1::varchar ;;
  }

  dimension: client_address_line_2 {
    group_label: "Client Addresses"
    label: "Client Address Line 2"
    type: string
    sql: cla.value:line2::varchar ;;
  }

  dimension: client_address_parent_key {
    group_label: "Client Addresses"
    label: "Client Address Parent Key"
    type: string
    sql: cla.value:parent_key::varchar ;;
  }

  dimension: client_address_postcode {
    group_label: "Client Addresses"
    label: "Client Address Postcode"
    type: string
    sql: cla.value:postcode::varchar ;;
  }

  dimension: client_address_region {
    group_label: "Client Addresses"
    label: "Client Address Region"
    type: string
    sql: cla.value:region::varchar ;;
  }

  measure: count {
    label: "Number of Client Addresses"
    type: count
  }
}


# Client Custom Field Sets - JSON List Array
# SQL:
# select  id as client_id,
#         custom_field_sets as custom_field_set_json,
#         clcfs.value:custom_field_set_id::varchar as custom_field_set_id,
#         clcfs.value:custom_field_values::variant as custom_field_values_json
# from mambu_beta.clients
# , lateral flatten(input => mambu_beta.clients.custom_field_sets) ccfs ;
view: client_custom_field_sets {
  view_label: "Clients"

  dimension: client_custom_field_set_pk {
    group_label: "Client Custom Fields"
    label: "Client Custom Field Set PK"
    type: string
    primary_key: yes
    hidden: yes
    sql: ${clients.id} || '-' || ${client_custom_field_set_id} ;;
  }

  dimension: client_custom_field_set_id {
    group_label: "Client Custom Fields"
    label: "Client Custom Field Set ID"
    type: string
    sql: clcfs.value:custom_field_set_id::varchar ;;
  }

  dimension: client_custom_field_values_json {
    group_label: "Client Custom Fields"
    label: "Client Custom Field Values JSON"
    type: string
    hidden: yes
    sql: clcfs.value:custom_field_values::variant ;;
  }

  measure: count {
    label: "Number of Client Custom Field Sets"
    type: count
  }
}


# Client Custom Field Sets - JSON List Array
# SQL:
# select  id as client_id,
#         custom_field_sets as custom_field_set_json,
#         clcfs.value:custom_field_set_id::varchar as custom_field_set_id,
#         clcfs.value:custom_field_values::variant as custom_field_values_json,
#         clcfv.value:custom_field_id::varchar as custom_field_id,
#         clcfv.value:custom_field_value::varchar as custom_field_value
# from mambu_beta.clients
# , lateral flatten(input => mambu_beta.clients.custom_field_sets) ccfs
# , lateral flatten(input => clcfs.value:custom_field_values) ccfv ;
view: client_custom_field_values {
  view_label: "Clients"

  dimension: client_custom_field_pk {
    group_label: "Client Custom Fields"
    label: "Client Custom Field PK"
    type: string
    primary_key: yes
    hidden: yes
    sql: ${clients.id} || '-' || ${client_custom_field_sets.client_custom_field_set_id} || '-' ||
      ${client_custom_field_id} ;;
  }

  dimension: client_custom_field_id {
    group_label: "Client Custom Fields"
    label: "Client Custom Field ID"
    type: string
    sql: clcfv.value:custom_field_id::varchar ;;
  }

  dimension: client_custom_field_value {
    group_label: "Client Custom Fields"
    label: "Client Custom Field Value"
    type: string
    sql: clcfv.value:custom_field_value::varchar ;;
  }

  measure: count {
    label: "Number of Client Custom Field Values"
    type: count
  }
}



# Clients - Main View
view: clients {
  sql_table_name: MAMBU_BETA.CLIENTS ;;
  drill_fields: [id]

  dimension: id {
    group_label: "Keys/IDs"
    label: "Client ID"
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

  dimension_group: activation {
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
    sql: ${TABLE}.ACTIVATION_DATE ;;
  }

  dimension: addresses {
    label: "Addresses JSON"
    type: string
    hidden: yes
    sql: ${TABLE}.ADDRESSES ;;
  }

  dimension_group: approved {
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
    sql: ${TABLE}.APPROVED_DATE ;;
  }

  dimension: assigned_centre_key {
    type: string
    sql: ${TABLE}.ASSIGNED_CENTRE_KEY ;;
  }

  dimension: birth_date {
    label: "Birth Date"
    type: date
    sql: ${TABLE}.BIRTH_DATE::DATE ;;
  }

  dimension: client_role_key {
    group_label: "Keys/IDs"
    label: "Client Role Key"
    type: string
    sql: ${TABLE}.CLIENT_ROLE_KEY ;;
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
    label: "Email"
    type: string
    sql: ${TABLE}.EMAIL_ADDRESS ;;
  }

  dimension: encoded_key {
    group_label: "Keys/IDs"
    label: "Client Key"
    type: string
    sql: ${TABLE}.ENCODED_KEY ;;
  }

  dimension: first_name {
    label: "First Name"
    type: string
    sql: ${TABLE}.FIRST_NAME ;;
  }

  dimension: gender {
    label: "Gender"
    type: string
    sql: ${TABLE}.GENDER ;;
  }

  dimension: group_loan_cycle {
    label: "Group Loan Cycle"
    type: number
    sql: ${TABLE}.GROUP_LOAN_CYCLE ;;
  }

  dimension: home_phone {
    label: "Home Phone"
    type: string
    sql: ${TABLE}.HOME_PHONE ;;
  }

  dimension: id_documents {
    type: string
    sql: ${TABLE}.ID_DOCUMENTS ;;
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

  dimension: last_name {
    label: "Last Name"
    type: string
    sql: ${TABLE}.LAST_NAME ;;
  }

  dimension: middle_name {
    label: "Middle Name"
    type: string
    sql: ${TABLE}.MIDDLE_NAME ;;
  }

  dimension: mobile_phone {
    label: "Mobile Phone"
    type: string
    sql: ${TABLE}.MOBILE_PHONE ;;
  }

  dimension: notes {
    label: "Client Notes"
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: preferred_language {
    label: "Preferred Language"
    type: string
    sql: ${TABLE}.PREFERRED_LANGUAGE ;;
  }

  dimension: state {
    label: "Client Status"
    type: string
    sql: ${TABLE}.STATE ;;
  }

  measure: count {
    label: "Number of Clients"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      first_name,
      last_name
    ]
  }
}
