
view: columns {
  view_label: "Columns"
  sql_table_name: @{info_schema_db}.INFORMATION_SCHEMA.COLUMNS ;;


  dimension: column_pk {
    label: "Column Key"
    type: string
    primary_key: yes
    sql: ${table_catalog} || '.' || ${table_schema} || '.' || ${table_name} || '.' || ${column_name} ;;
    hidden: yes
  }

  dimension: table_key {
    label: "Table Key"
    type: string
    sql: ${table_catalog} || '.' || ${table_schema} || '.' || ${table_name} ;;
    hidden: yes
  }

  dimension: catalog_schema_name {
    label: "Catalog.Schema Name"
    type: string
    sql: ${table_catalog} || '.' || ${table_schema} ;;
  }

  dimension: character_maximum_length {
    group_label: "Character"
    label: "Char Max Length"
    type: number
    sql: ${TABLE}.CHARACTER_MAXIMUM_LENGTH ;;
  }

  dimension: character_octet_length {
    group_label: "Character"
    label: "Char Octet Length"
    type: number
    sql: ${TABLE}.CHARACTER_OCTET_LENGTH ;;
    hidden: yes
  }

  dimension: character_set_catalog {
    group_label: "Character Set"
    label: "Character Set Catalog"
    type: string
    sql: ${TABLE}.CHARACTER_SET_CATALOG ;;
  }

  dimension: character_set_name {
    group_label: "Character Set"
    label: "Character Set Name"
    type: string
    sql: ${TABLE}.CHARACTER_SET_NAME ;;
  }

  dimension: character_set_schema {
    group_label: "Character Set"
    label: "Character Set Schema"
    type: string
    sql: ${TABLE}.CHARACTER_SET_SCHEMA ;;
  }

  dimension: collation_catalog {
    group_label: "Collation"
    label: "Collation Catalog"
    type: string
    sql: ${TABLE}.COLLATION_CATALOG ;;
  }

  dimension: collation_name {
    group_label: "Collation"
    label: "Collation Name"
    type: string
    sql: ${TABLE}.COLLATION_NAME ;;
  }

  dimension: collation_schema {
    group_label: "Collation"
    label: "Collation Schema"
    type: string
    sql: ${TABLE}.COLLATION_SCHEMA ;;
  }

  dimension: column_default {
    label: "Column Default"
    type: string
    sql: ${TABLE}.COLUMN_DEFAULT ;;
  }

  dimension: column_name {
    label: "Column Name"
    type: string
    sql: ${TABLE}.COLUMN_NAME ;;
  }

  dimension: comment {
    label: "Column Comment"
    type: string
    sql: ${TABLE}.COMMENT ;;
  }

  dimension: data_type {
    label: "Data Type"
    type: string
    sql: ${TABLE}.DATA_TYPE ;;
  }

  dimension: datetime_precision {
    label: "Datetime Precision"
    type: number
    sql: ${TABLE}.DATETIME_PRECISION ;;
  }

  dimension: domain_catalog {
    group_label: "Domain"
    label: "Domain Catalog"
    type: string
    sql: ${TABLE}.DOMAIN_CATALOG ;;
  }

  dimension: domain_name {
    group_label: "Domain"
    label: "Domain Name"
    type: string
    sql: ${TABLE}.DOMAIN_NAME ;;
  }

  dimension: domain_schema {
    group_label: "Domain"
    label: "Domain Schema"
    type: string
    sql: ${TABLE}.DOMAIN_SCHEMA ;;
  }

  dimension: dtd_identifier {
    label: "DTD Identifier"
    type: string
    sql: ${TABLE}.DTD_IDENTIFIER ;;
  }

  dimension: identity_cycle {
    group_label: "Identity"
    label: "Identity Cycle"
    type: string
    sql: ${TABLE}.IDENTITY_CYCLE ;;
  }

  dimension: identity_generation {
    group_label: "Identity"
    label: "Identity Generation"
    type: string
    sql: ${TABLE}.IDENTITY_GENERATION ;;
  }

  dimension: identity_increment {
    group_label: "Identity"
    label: "Identity Increment"
    type: string
    sql: ${TABLE}.IDENTITY_INCREMENT ;;
  }

  dimension: identity_maximum {
    group_label: "Identity"
    label: "Identity Max"
    type: string
    sql: ${TABLE}.IDENTITY_MAXIMUM ;;
  }

  dimension: identity_minimum {
    group_label: "Identity"
    label: "Identity Min"
    type: string
    sql: ${TABLE}.IDENTITY_MINIMUM ;;
  }

  dimension: identity_start {
    group_label: "Identity"
    label: "Identity Start"
    type: string
    sql: ${TABLE}.IDENTITY_START ;;
  }

  dimension: interval_precision {
    group_label: "Interval"
    label: "Interval Precision"
    type: number
    sql: ${TABLE}.INTERVAL_PRECISION ;;
  }

  dimension: interval_type {
    group_label: "Interval"
    label: "Interval Type"
    type: string
    sql: ${TABLE}.INTERVAL_TYPE ;;
  }

  dimension: is_identity {
    group_label: "Identity"
    label: "Is Identity"
    type: string
    sql: ${TABLE}.IS_IDENTITY ;;
  }

  dimension: is_nullable {
    label: "Is Nullable"
    type: string
    sql: ${TABLE}.IS_NULLABLE ;;
  }


  dimension: is_self_referencing {
    label: "Is Self Referencing"
    type: string
    sql: ${TABLE}.IS_SELF_REFERENCING ;;
  }

  dimension: column_lookml_pk {
    group_label: "LookML"
    label: "Column LookML PK"
    description: "Primary key candidate for LookML based on is_identity, is_nullable, and column_name."
    type: yesno
    sql: CASE WHEN ${is_identity} = 'YES' AND ${is_nullable} = 'NO' THEN TRUE
              WHEN ${column_name} = 'ID' AND ${is_nullable} = 'NO' THEN TRUE
              WHEN STARTSWITH(${column_name}, ${table_name}) AND
                ENDSWITH(${column_name}, 'ID') AND ${is_nullable} = 'NO' THEN TRUE
              ELSE FALSE END ;;
  }

  dimension: column_lookml_type {
    group_label: "LookML"
    label: "Column LookML Type"
    type: string
    sql: CASE WHEN ${data_type} = 'BOOLEAN' THEN 'yesno'
              WHEN ${data_type} = 'NUMBER' THEN 'number'
              WHEN ${data_type} = 'TEXT' THEN 'string'
              WHEN ${data_type} = 'DATE' THEN 'time'
              WHEN LEFT(${data_type}, 4) = 'TIME' THEN 'time'
              ELSE 'string' END ;;
  }

  dimension: column_lookml_is_dimension_group {
    group_label: "LookML"
    label: "Column LookML Is Dimension Group"
    type: yesno
    sql: LEFT(${data_type}, 4) IN ('DATE', 'TIME') ;;
  }

  dimension: column_lookml_label {
    group_label: "LookML"
    label: "Column LookML Label"
    type: string
    sql: initcap(replace(${column_name}, '_', ' '))  ;;
  }

  dimension: column_lookml_sql {
    group_label: "LookML"
    label: "Column LookML SQL"
    type: string
    sql: '\$\{TABLE\}\.' || ${column_name} ;;
    hidden: yes
  }

  dimension: column_lookml_proposed {
    group_label: "LookML"
    label: "Column LookML Proposed"
    type: string
    html: {% if column_lookml_is_dimension_group._value == 'Yes'  %}
              dimension_group: {{ column_name._value | downcase }} { <br>
          {% else %}
              dimension: {{ column_name._value | downcase }} { <br>
          {% endif %}
          &nbsp &nbsp label: "{{ column_lookml_label._value }}" <br>
          &nbsp &nbsp type: {{ column_lookml_type._value }} <br>
          {% if data_type._value == 'DATE' %}
              &nbsp &nbsp datatype: date <br>
          {% elsif data_type._value == 'DATETIME' %}
              &nbsp &nbsp datatype: datetime <br>
          {% elsif data_type._value contains 'TIMESTAMP' %}
              &nbsp &nbsp datatype: timestamp <br>
          {% endif %}
          {% if column_lookml_is_dimension_group._value == 'Yes' %}
              &nbsp &nbsp timeframes: [raw, time, date, week, month, quarter, year] <br>
          {% endif %}
          {% if column_lookml_pk._value == 'Yes' %}
              &nbsp &nbsp primary_key: yes <br>
          {% endif %}
          &nbsp &nbsp sql: <p style="display:inline; color: dimgray; background-color: gainsboro; font-size:100%; text-align:left"> {{ column_lookml_sql._value }} </p> &nbsp ;\;<br>
          } <br> ;;
    sql:  {% if column_lookml_is_dimension_group._value == 'Yes'  %}
              'dimension_group\: ' || lower(${column_name}) || ' \{ \n' ||
          {% else %}
              'dimension\: ' || lower(${column_name}) || ' \{ \n' ||
          {% endif %}
          '  label\: "' || ${column_lookml_label} || '" \n' ||
          '  type\: ' || ${column_lookml_type} || ' \n' ||
          {% if column_lookml_is_dimension_group._value == 'Yes'  %}
              '  timeframes\: \[raw, time, date, week, month, quarter, year\] \n' ||
          {% endif %}
          '  sql\: \$\{TABLE\}\.' || ${column_name} || '\;\; \n' ||
          '\} \n' ;;
  }

  dimension: maximum_cardinality {
    label: "Max Cardinality"
    type: number
    sql: ${TABLE}.MAXIMUM_CARDINALITY ;;
  }

  dimension: numeric_precision {
    label: "Numeric Precision"
    type: number
    sql: ${TABLE}.NUMERIC_PRECISION ;;
  }

  dimension: numeric_precision_radix {
    label: "Numeric Precision Radix"
    type: number
    sql: ${TABLE}.NUMERIC_PRECISION_RADIX ;;
    hidden: yes
  }

  dimension: numeric_scale {
    label: "Numeric Scale"
    type: number
    sql: ${TABLE}.NUMERIC_SCALE ;;
  }

  dimension: ordinal_position {
    label: "Ordinal Position"
    description: "Column Order in Table"
    type: number
    sql: ${TABLE}.ORDINAL_POSITION ;;
  }

  dimension: schema_table_name {
    label: "Schema.Table Name"
    type: string
    sql: ${table_schema} || '.' || ${table_name} ;;
  }

  dimension: scope_catalog {
    group_label: "Scope"
    label: "Scope Catalog"
    type: string
    sql: ${TABLE}.SCOPE_CATALOG ;;
  }

  dimension: scope_name {
    group_label: "Scope"
    label: "Scope Name"
    type: string
    sql: ${TABLE}.SCOPE_NAME ;;
  }

  dimension: scope_schema {
    group_label: "Scope"
    label: "Scope Schema"
    type: string
    sql: ${TABLE}.SCOPE_SCHEMA ;;
  }

  dimension: table_catalog {
    group_label: "Table"
    label: "Catalog"
    type: string
    sql: ${TABLE}.TABLE_CATALOG ;;
  }

  dimension: table_column_name {
    label: "Table.Column Name"
    type: string
    sql: ${table_name} || '.' || ${column_name} ;;
  }

  dimension: table_name {
    group_label: "Table"
    label: "Table Name"
    type: string
    sql: ${TABLE}.TABLE_NAME ;;
  }

  dimension: table_schema {
    group_label: "Table"
    label: "Schema"
    type: string
    sql: ${TABLE}.TABLE_SCHEMA ;;
  }

  dimension: udt_catalog {
    group_label: "UDT"
    label: "UDT Catalog"
    type: string
    sql: ${TABLE}.UDT_CATALOG ;;
  }

  dimension: udt_name {
    group_label: "UDT"
    label: "UDT Name"
    type: string
    sql: ${TABLE}.UDT_NAME ;;
  }

  dimension: udt_schema {
    group_label: "UDT"
    label: "UDT Schema"
    type: string
    sql: ${TABLE}.UDT_SCHEMA ;;
  }

  measure: count {
    label: "Number of Columns"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      table_name,
      column_name,
      data_type,
      column_default,
      character_maximum_length,
      numeric_scale,
      numeric_precision
    ]
  }
}
