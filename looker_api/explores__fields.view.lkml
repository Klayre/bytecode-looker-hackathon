view: explores__fields {
  derived_table: {
    sql:
-- Dimensions
select  ex.id as explore_id,
        ex.name as explore_name,
        ex.model_name as model_name,
        dim.value::variant as dim,
        dim.value:align::varchar as align,
        dim.value:can_filter::boolean as can_filter,
        dim.value:can_time_filter::boolean as can_time_filter,
        dim.value:category::varchar as category,
        dim.value:default_filter_value::varchar as default_filter_value,
        dim.value:description::varchar as description,
        dim.value:dynamic::boolean as dynamic,
        dim.value:enumerations::variant as enumerations,
        dim.value:field_group_label::varchar as field_group_label,
        dim.value:field_group_variant::varchar as field_group_variant,
        dim.value:fill_style::varchar as fill_style,
        dim.value:fiscal_month_offset::int as fical_month_offset,
        dim.value:has_allowed_values::boolean as has_allowed_values,
        dim.value:hidden::boolean as hidden,
        dim.value:is_filter::boolean as is_filter,
        dim.value:is_fiscal::boolean as is_fiscal,
        dim.value:is_numeric::boolean as is_numeric,
        dim.value:is_timeframe::boolean as is_timeframe,
        dim.value:label::varchar as label,
        dim.value:label_from_parameter::varchar as label_from_parameter,
        dim.value:label_short::varchar as label_short,
        dim.value:lookml_link::varchar as lookml_link,
        dim.value:map_layer:extents_json_url::varchar as map_layer__extents_json_url,
        dim.value:map_layer:feature_key::varchar as map_layer__feature_key,
        dim.value:map_layer:format::varchar as map_layer__format,
        dim.value:map_layer:max_zoom_level::integer as map_layer__max_zoom_level,
        dim.value:map_layer:min_zoom_level::integer as map_layer__min_zoom_level,
        dim.value:map_layer:name::varchar as map_layer__name,
        dim.value:map_layer:projection::varchar as map_layer__projection,
        dim.value:map_layer:projection_key::varchar as map_layer__projection_key,
        dim.value:map_layer:projection_label_key::varchar as map_layer__projection_label_key,
        dim.value:map_layer:url::varchar as map_layer__url,
        dim.value:measure::boolean as measure,
        dim.value:name::varchar as name,
        dim.value:parameter::boolean as parameter,
        dim.value:permanent::boolean as permanent,
        dim.value:primary_key::boolean as primary_key,
        dim.value:project_name::varchar as project_name,
        dim.value:requires_refresh_on_sort::boolean as requires_refresh_on_sort,
        dim.value:scope::varchar as scope,
        dim.value:sortable::boolean as sortable,
        dim.value:source_file::varchar as source_file,
        dim.value:source_file_path::varchar as source_file_path,
        dim.value:"sql"::varchar as "sql",
        dim.value:sql_case::variant as sql_cases,
        dim.value:strict_value_format::boolean as strict_value_format,
        dim.value:suggest_dimension::varchar as suggest_dimension,
        dim.value:suggest_explore::varchar as suggest_explore,
        dim.value:suggestable::boolean as suggestable,
        dim.value:suggestions::variant as suggestions,
        dim.value:tags::variant as tags,
        dim.value:time_interval:count::varchar as time_interval__count,
        dim.value:time_interval:name::varchar as time_interval__name,
        dim.value:"type"::varchar as "type",
        dim.value:user_attribute_filter_types::variant as user_attribute_filter_types,
        dim.value:value_format::varchar as value_format,
        dim.value:"view"::varchar as view_name,
        dim.value:view_label::varchar as view_label,
        dim.value:week_start_day::varchar as week_start_day
from looker.explores ex
, lateral flatten(input => ex.fields:dimensions) dim

UNION

-- Measures
select  ex.id as explore_id,
        ex.name as explore_name,
        ex.model_name as model_name,
        dim.value::variant as dim,
        dim.value:align::varchar as align,
        dim.value:can_filter::boolean as can_filter,
        dim.value:can_time_filter::boolean as can_time_filter,
        dim.value:category::varchar as category,
        dim.value:default_filter_value::varchar as default_filter_value,
        dim.value:description::varchar as description,
        dim.value:dynamic::boolean as dynamic,
        dim.value:enumerations::variant as enumerations,
        dim.value:field_group_label::varchar as field_group_label,
        dim.value:field_group_variant::varchar as field_group_variant,
        dim.value:fill_style::varchar as fill_style,
        dim.value:fiscal_month_offset::int as fical_month_offset,
        dim.value:has_allowed_values::boolean as has_allowed_values,
        dim.value:hidden::boolean as hidden,
        dim.value:is_filter::boolean as is_filter,
        dim.value:is_fiscal::boolean as is_fiscal,
        dim.value:is_numeric::boolean as is_numeric,
        dim.value:is_timeframe::boolean as is_timeframe,
        dim.value:label::varchar as label,
        dim.value:label_from_parameter::varchar as label_from_parameter,
        dim.value:label_short::varchar as label_short,
        dim.value:lookml_link::varchar as lookml_link,
        dim.value:map_layer:extents_json_url::varchar as map_layer__extents_json_url,
        dim.value:map_layer:feature_key::varchar as map_layer__feature_key,
        dim.value:map_layer:format::varchar as map_layer__format,
        dim.value:map_layer:max_zoom_level::integer as map_layer__max_zoom_level,
        dim.value:map_layer:min_zoom_level::integer as map_layer__min_zoom_level,
        dim.value:map_layer:name::varchar as map_layer__name,
        dim.value:map_layer:projection::varchar as map_layer__projection,
        dim.value:map_layer:projection_key::varchar as map_layer__projection_key,
        dim.value:map_layer:projection_label_key::varchar as map_layer__projection_label_key,
        dim.value:map_layer:url::varchar as map_layer__url,
        dim.value:measure::boolean as measure,
        dim.value:name::varchar as name,
        dim.value:parameter::boolean as parameter,
        dim.value:permanent::boolean as permanent,
        dim.value:primary_key::boolean as primary_key,
        dim.value:project_name::varchar as project_name,
        dim.value:requires_refresh_on_sort::boolean as requires_refresh_on_sort,
        dim.value:scope::varchar as scope,
        dim.value:sortable::boolean as sortable,
        dim.value:source_file::varchar as source_file,
        dim.value:source_file_path::varchar as source_file_path,
        dim.value:"sql"::varchar as "sql",
        dim.value:sql_case::variant as sql_cases,
        dim.value:strict_value_format::boolean as strict_value_format,
        dim.value:suggest_dimension::varchar as suggest_dimension,
        dim.value:suggest_explore::varchar as suggest_explore,
        dim.value:suggestable::boolean as suggestable,
        dim.value:suggestions::variant as suggestions,
        dim.value:tags::variant as tags,
        dim.value:time_interval:count::varchar as time_interval__count,
        dim.value:time_interval:name::varchar as time_interval__name,
        dim.value:"type"::varchar as "type",
        dim.value:user_attribute_filter_types::variant as user_attribute_filter_types,
        dim.value:value_format::varchar as value_format,
        dim.value:"view"::varchar as view_name,
        dim.value:view_label::varchar as view_label,
        dim.value:week_start_day::varchar as week_start_day
from looker.explores ex
, lateral flatten(input => ex.fields:measures) dim

UNION

-- Filters
select  ex.id as explore_id,
        ex.name as explore_name,
        ex.model_name as model_name,
        dim.value::variant as dim,
        dim.value:align::varchar as align,
        dim.value:can_filter::boolean as can_filter,
        dim.value:can_time_filter::boolean as can_time_filter,
        dim.value:category::varchar as category,
        dim.value:default_filter_value::varchar as default_filter_value,
        dim.value:description::varchar as description,
        dim.value:dynamic::boolean as dynamic,
        dim.value:enumerations::variant as enumerations,
        dim.value:field_group_label::varchar as field_group_label,
        dim.value:field_group_variant::varchar as field_group_variant,
        dim.value:fill_style::varchar as fill_style,
        dim.value:fiscal_month_offset::int as fical_month_offset,
        dim.value:has_allowed_values::boolean as has_allowed_values,
        dim.value:hidden::boolean as hidden,
        dim.value:is_filter::boolean as is_filter,
        dim.value:is_fiscal::boolean as is_fiscal,
        dim.value:is_numeric::boolean as is_numeric,
        dim.value:is_timeframe::boolean as is_timeframe,
        dim.value:label::varchar as label,
        dim.value:label_from_parameter::varchar as label_from_parameter,
        dim.value:label_short::varchar as label_short,
        dim.value:lookml_link::varchar as lookml_link,
        dim.value:map_layer:extents_json_url::varchar as map_layer__extents_json_url,
        dim.value:map_layer:feature_key::varchar as map_layer__feature_key,
        dim.value:map_layer:format::varchar as map_layer__format,
        dim.value:map_layer:max_zoom_level::integer as map_layer__max_zoom_level,
        dim.value:map_layer:min_zoom_level::integer as map_layer__min_zoom_level,
        dim.value:map_layer:name::varchar as map_layer__name,
        dim.value:map_layer:projection::varchar as map_layer__projection,
        dim.value:map_layer:projection_key::varchar as map_layer__projection_key,
        dim.value:map_layer:projection_label_key::varchar as map_layer__projection_label_key,
        dim.value:map_layer:url::varchar as map_layer__url,
        dim.value:measure::boolean as measure,
        dim.value:name::varchar as name,
        dim.value:parameter::boolean as parameter,
        dim.value:permanent::boolean as permanent,
        dim.value:primary_key::boolean as primary_key,
        dim.value:project_name::varchar as project_name,
        dim.value:requires_refresh_on_sort::boolean as requires_refresh_on_sort,
        dim.value:scope::varchar as scope,
        dim.value:sortable::boolean as sortable,
        dim.value:source_file::varchar as source_file,
        dim.value:source_file_path::varchar as source_file_path,
        dim.value:"sql"::varchar as "sql",
        dim.value:sql_case::variant as sql_cases,
        dim.value:strict_value_format::boolean as strict_value_format,
        dim.value:suggest_dimension::varchar as suggest_dimension,
        dim.value:suggest_explore::varchar as suggest_explore,
        dim.value:suggestable::boolean as suggestable,
        dim.value:suggestions::variant as suggestions,
        dim.value:tags::variant as tags,
        dim.value:time_interval:count::varchar as time_interval__count,
        dim.value:time_interval:name::varchar as time_interval__name,
        dim.value:"type"::varchar as "type",
        dim.value:user_attribute_filter_types::variant as user_attribute_filter_types,
        dim.value:value_format::varchar as value_format,
        dim.value:"view"::varchar as view_name,
        dim.value:view_label::varchar as view_label,
        dim.value:week_start_day::varchar as week_start_day
from looker.explores ex
, lateral flatten(input => ex.fields:filters) dim

UNION

-- Parameters
select  ex.id as explore_id,
        ex.name as explore_name,
        ex.model_name as model_name,
        dim.value::variant as dim,
        dim.value:align::varchar as align,
        dim.value:can_filter::boolean as can_filter,
        dim.value:can_time_filter::boolean as can_time_filter,
        dim.value:category::varchar as category,
        dim.value:default_filter_value::varchar as default_filter_value,
        dim.value:description::varchar as description,
        dim.value:dynamic::boolean as dynamic,
        dim.value:enumerations::variant as enumerations,
        dim.value:field_group_label::varchar as field_group_label,
        dim.value:field_group_variant::varchar as field_group_variant,
        dim.value:fill_style::varchar as fill_style,
        dim.value:fiscal_month_offset::int as fical_month_offset,
        dim.value:has_allowed_values::boolean as has_allowed_values,
        dim.value:hidden::boolean as hidden,
        dim.value:is_filter::boolean as is_filter,
        dim.value:is_fiscal::boolean as is_fiscal,
        dim.value:is_numeric::boolean as is_numeric,
        dim.value:is_timeframe::boolean as is_timeframe,
        dim.value:label::varchar as label,
        dim.value:label_from_parameter::varchar as label_from_parameter,
        dim.value:label_short::varchar as label_short,
        dim.value:lookml_link::varchar as lookml_link,
        dim.value:map_layer:extents_json_url::varchar as map_layer__extents_json_url,
        dim.value:map_layer:feature_key::varchar as map_layer__feature_key,
        dim.value:map_layer:format::varchar as map_layer__format,
        dim.value:map_layer:max_zoom_level::integer as map_layer__max_zoom_level,
        dim.value:map_layer:min_zoom_level::integer as map_layer__min_zoom_level,
        dim.value:map_layer:name::varchar as map_layer__name,
        dim.value:map_layer:projection::varchar as map_layer__projection,
        dim.value:map_layer:projection_key::varchar as map_layer__projection_key,
        dim.value:map_layer:projection_label_key::varchar as map_layer__projection_label_key,
        dim.value:map_layer:url::varchar as map_layer__url,
        dim.value:measure::boolean as measure,
        dim.value:name::varchar as name,
        dim.value:parameter::boolean as parameter,
        dim.value:permanent::boolean as permanent,
        dim.value:primary_key::boolean as primary_key,
        dim.value:project_name::varchar as project_name,
        dim.value:requires_refresh_on_sort::boolean as requires_refresh_on_sort,
        dim.value:scope::varchar as scope,
        dim.value:sortable::boolean as sortable,
        dim.value:source_file::varchar as source_file,
        dim.value:source_file_path::varchar as source_file_path,
        dim.value:"sql"::varchar as "sql",
        dim.value:sql_case::variant as sql_cases,
        dim.value:strict_value_format::boolean as strict_value_format,
        dim.value:suggest_dimension::varchar as suggest_dimension,
        dim.value:suggest_explore::varchar as suggest_explore,
        dim.value:suggestable::boolean as suggestable,
        dim.value:suggestions::variant as suggestions,
        dim.value:tags::variant as tags,
        dim.value:time_interval:count::varchar as time_interval__count,
        dim.value:time_interval:name::varchar as time_interval__name,
        dim.value:"type"::varchar as "type",
        dim.value:user_attribute_filter_types::variant as user_attribute_filter_types,
        dim.value:value_format::varchar as value_format,
        dim.value:"view"::varchar as view_name,
        dim.value:view_label::varchar as view_label,
        dim.value:week_start_day::varchar as week_start_day
from looker.explores ex
, lateral flatten(input => ex.fields:parameters) dim
 ;;
  }

  dimension: field_id {
    group_label: "Keys/IDs"
    label: "Field ID"
    type: string
    primary_key: yes
    sql: ${explore_id} || '::' || ${name} ;;
  }

  dimension: explore_id {
    group_label: "Keys/IDs"
    label: "Explore ID"
    type: string
    sql: ${TABLE}.EXPLORE_ID ;;
  }

  dimension: explore_name {
    group_label: "Keys/IDs"
    label: "Keys/IDs"
    type: string
    sql: ${TABLE}.EXPLORE_NAME ;;
    hidden: yes
  }

  dimension: model_name {
    group_label: "Keys/IDs"
    label: "Model Name"
    type: string
    sql: ${TABLE}.MODEL_NAME ;;
  }

  dimension: project_file_key {
    group_label: "Keys/IDs"
    label: "Project File Key"
    type: string
    sql: ${project_name} || '::' || ${model_name} || '.model';;
  }

  dimension: field {
    label: "Field JSON"
    type: string
    sql: ${TABLE}.DIM ;;
    hidden: yes
  }

  dimension: align {
    type: string
    sql: ${TABLE}.ALIGN ;;
  }

  dimension: can_filter {
    type: yesno
    sql: ${TABLE}.CAN_FILTER ;;
  }

  dimension: can_time_filter {
    type: yesno
    sql: ${TABLE}.CAN_TIME_FILTER ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.CATEGORY ;;
  }

  dimension: default_filter_value {
    type: string
    sql: ${TABLE}.DEFAULT_FILTER_VALUE ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: dynamic {
    type: yesno
    sql: ${TABLE}.DYNAMIC ;;
  }

  dimension: enumerations {
    type: string
    sql: ${TABLE}.ENUMERATIONS ;;
    hidden: yes
  }

  dimension: field_group_label {
    type: string
    sql: ${TABLE}.FIELD_GROUP_LABEL ;;
  }

  dimension: field_group_variant {
    type: string
    sql: ${TABLE}.FIELD_GROUP_VARIANT ;;
  }

  dimension: fill_style {
    type: string
    sql: ${TABLE}.FILL_STYLE ;;
  }

  dimension: fical_month_offset {
    type: number
    sql: ${TABLE}.FICAL_MONTH_OFFSET ;;
  }

  dimension: has_allowed_values {
    type: yesno
    sql: ${TABLE}.HAS_ALLOWED_VALUES ;;
  }

  dimension: hidden {
    type: yesno
    sql: ${TABLE}.HIDDEN ;;
  }

  dimension: is_filter {
    type: yesno
    sql: ${TABLE}.IS_FILTER ;;
  }

  dimension: is_fiscal {
    type: yesno
    sql: ${TABLE}.IS_FISCAL ;;
  }

  dimension: is_numeric {
    type: yesno
    sql: ${TABLE}.IS_NUMERIC ;;
  }

  dimension: is_timeframe {
    type: yesno
    sql: ${TABLE}.IS_TIMEFRAME ;;
  }

  dimension: label {
    label: "Field Label Long"
    type: string
    sql: ${TABLE}.LABEL ;;
  }

  dimension: label_from_parameter {
    type: string
    sql: ${TABLE}.LABEL_FROM_PARAMETER ;;
  }

  dimension: label_short {
    label: "Field Label"
    type: string
    sql: ${TABLE}.LABEL_SHORT ;;
  }

  dimension: lookml_link {
    type: string
    sql: ${TABLE}.LOOKML_LINK ;;
  }

  dimension: map_layer__extents_json_url {
    group_label: "Map Layer"
    label: "Map Layer Extents JSON URL"
    type: string
    sql: ${TABLE}.MAP_LAYER__EXTENTS_JSON_URL ;;
  }

  dimension: map_layer__feature_key {
    group_label: "Map Layer"
    type: string
    sql: ${TABLE}.MAP_LAYER__FEATURE_KEY ;;
  }

  dimension: map_layer__format {
    group_label: "Map Layer"
    type: string
    sql: ${TABLE}.MAP_LAYER__FORMAT ;;
  }

  dimension: map_layer__max_zoom_level {
    group_label: "Map Layer"
    type: number
    sql: ${TABLE}.MAP_LAYER__MAX_ZOOM_LEVEL ;;
  }

  dimension: map_layer__min_zoom_level {
    group_label: "Map Layer"
    type: number
    sql: ${TABLE}.MAP_LAYER__MIN_ZOOM_LEVEL ;;
  }

  dimension: map_layer__name {
    group_label: "Map Layer"
    type: string
    sql: ${TABLE}.MAP_LAYER__NAME ;;
  }

  dimension: map_layer__projection {
    group_label: "Map Layer"
    type: string
    sql: ${TABLE}.MAP_LAYER__PROJECTION ;;
  }

  dimension: map_layer__projection_key {
    group_label: "Map Layer"
    type: string
    sql: ${TABLE}.MAP_LAYER__PROJECTION_KEY ;;
  }

  dimension: map_layer__projection_label_key {
    group_label: "Map Layer"
    type: string
    sql: ${TABLE}.MAP_LAYER__PROJECTION_LABEL_KEY ;;
  }

  dimension: map_layer__url {
    group_label: "Map Layer"
    label: "Map Layer URL"
    type: string
    sql: ${TABLE}.MAP_LAYER__URL ;;
  }

  dimension: measure {
    type: yesno
    sql: ${TABLE}.MEASURE ;;
  }

  dimension: name {
    label: "Field Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: parameter {
    type: yesno
    sql: ${TABLE}.PARAMETER ;;
  }

  dimension: permanent {
    type: yesno
    sql: ${TABLE}.PERMANENT ;;
  }

  dimension: primary_key {
    type: yesno
    sql: ${TABLE}.PRIMARY_KEY ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.PROJECT_NAME ;;
  }

  dimension: requires_refresh_on_sort {
    type: yesno
    sql: ${TABLE}.REQUIRES_REFRESH_ON_SORT ;;
  }

  dimension: scope {
    type: string
    sql: ${TABLE}.SCOPE ;;
  }

  dimension: sortable {
    type: yesno
    sql: ${TABLE}.SORTABLE ;;
  }

  dimension: source_file {
    type: string
    sql: ${TABLE}.SOURCE_FILE ;;
  }

  dimension: source_file_path {
    type: string
    sql: ${TABLE}.SOURCE_FILE_PATH ;;
  }

  dimension: sql {
    label: "SQL"
    type: string
    sql: ${TABLE}.sql ;;
  }

  dimension: sql_cases {
    label: "SQL Cases JSON"
    type: string
    sql: ${TABLE}.SQL_CASES ;;
    hidden: yes
  }

  dimension: strict_value_format {
    type: yesno
    sql: ${TABLE}.STRICT_VALUE_FORMAT ;;
  }

  dimension: suggest_dimension {
    type: string
    sql: ${TABLE}.SUGGEST_DIMENSION ;;
  }

  dimension: suggest_explore {
    type: string
    sql: ${TABLE}.SUGGEST_EXPLORE ;;
  }

  dimension: suggestable {
    type: yesno
    sql: ${TABLE}.SUGGESTABLE ;;
  }

  dimension: suggestions {
    label: "Suggestions JSON"
    type: string
    sql: ${TABLE}.SUGGESTIONS ;;
    hidden: yes
  }

  dimension: suggestions_list {
    label: "Suggestions List"
    type: string
    sql: array_to_string(parse_json(${suggestions}), ', ') ;;
  }

  dimension: tags {
    label: "Tags JSON"
    type: string
    sql: ${TABLE}.TAGS ;;
    hidden: yes
  }

  dimension: tags_list {
    label: "Tags List"
    type: string
    sql: array_to_string(parse_json(${tags}), ', ') ;;
  }

  dimension: time_interval__count {
    type: string
    sql: ${TABLE}.TIME_INTERVAL__COUNT ;;
  }

  dimension: time_interval__name {
    type: string
    sql: ${TABLE}.TIME_INTERVAL__NAME ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}."type" ;;
  }

  dimension: user_attribute_filter_types {
    label: "User Attr Filter Types JSON"
    type: string
    sql: ${TABLE}.USER_ATTRIBUTE_FILTER_TYPES ;;
    hidden: yes
  }

  dimension: user_attribute_filter_types_list {
    label: "User Attr Filter Types List"
    type: string
    sql: array_to_string(parse_json(${user_attribute_filter_types}), ', ') ;;
  }

  dimension: value_format {
    type: string
    sql: ${TABLE}.VALUE_FORMAT ;;
  }

  dimension: view_name {
    type: string
    sql: ${TABLE}.view_name ;;
  }

  dimension: view_label {
    type: string
    sql: ${TABLE}.VIEW_LABEL ;;
  }

  dimension: week_start_day {
    type: string
    sql: ${TABLE}.WEEK_START_DAY ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      explore_id,
      explore_name,
      view_name,
      scope,
      name,
      label,
      category,
      type,
      primary_key,
      hidden,
      sql,
      description
    ]
  }
}
