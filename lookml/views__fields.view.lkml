view: views__fields {
  view_label: "Fields"
  derived_table: {
    sql:
    -- Dimension Groups: Timeframes
    select  v.sha as view_sha,
      v.path as view_path,
      v.name as view_name,
      v.git_owner as git_owner,
      v.git_repository as git_repository,
      v.sql_table_name as sql_table_name,
      'dimension_groups' as field_category,
      -- dg.value::variant as field,
      NULL::variant as actions,
      dg.value:alias::variant as alias,
      dg.value:allow_fill::varchar as allow_fill,
      NULL::variant as allowed_values,
      NULL::varchar as alpha_sort,
      NULL::varchar as approximate,
      NULL::float as approximate_threshold,
      dg.value:bypass_suggest_restrictions::varchar as bypass_suggest_restrictions,
      dg.value:can_filter::varchar as can_filter,
      NULL::variant as case__whens,
      NULL::varchar as case_sensitive,
      dg.value:convert_tz::varchar as convert_tz,
      dg.value:datatype::varchar as datatype,
      NULL::varchar as default_value,
      dg.value:description::varchar as description,
      NULL::varchar as direction,
      dg.value:drill_fields::variant as drill_fields,
      dg.value:fanout_on::varchar as fanout_on,
      NULL::variant as filters,
      dg.value:full_suggestions::varchar as full_suggestions,
      dg.value:group_item_label::varchar as group_item_label,
      dg.value:group_label::varchar as group_label,
      dg.value:hidden::varchar as hidden,
      dg.value:html::varchar as html,
      NULL as interval,
      CASE WHEN dg.value:label::varchar IS NOT NULL THEN dg.value:label::varchar || ' ' || initcap(dgtf.value::varchar)
            ELSE initcap(dgtf.value::varchar) END as label,
      COALESCE(dg.value:label::varchar, initcap(replace(dg.value:name::varchar, '_', ' '))) || ' ' || initcap(dgtf.value::varchar) as label_displayed,
      NULL::varchar as label_from_parameter,
      NULL::variant as links,
      NULL::varchar as map_layer_name,
      NULL::varchar as list_field,
      dg.value:name::varchar || '_' || lower(dgtf.value::varchar) as name,
      dg.value:order_by_field::varchar as order_by_field,
      NULL::float as percentile,
      NULL::int as precision,
      NULL::varchar as primary_key,
      dg.value:required_access_grants::variant as required_access_grants,
      NULL::variant as required_fields,
      dg.value:skip_drill_filter::varchar as skip_drill_filter,
      dg.value:sql::varchar as "sql",
      NULL::varchar as sql_distinct_key,
      dg.value:sql_end::varchar as sql_end,
      NULL::varchar as sql_latitude,
      NULL::varchar as sql_longitude,
      dg.value:sql_start::varchar as sql_start,
      NULL::varchar as style,
      dg.value:suggest_dimension::varchar as suggest_dimension,
      dg.value:suggest_explore::varchar as suggest_explore,
      NULL::varchar as suggest_persist_for,
      dg.value:suggestable::varchar as suggestable,
      NULL::varchar as suggestions,
      dg.value:tags::variant as tags,
      NULL::variant as tiers,
      dgtf.value::varchar as timeframe,
      'date_' || dgtf.value::varchar as "type",
      NULL::varchar as value_format,
      NULL::varchar as value_format_name,
      dg.value:view_label::varchar as view_label
      from lookml.views v
      , lateral flatten(input => v.dimension_groups) dg
      , lateral flatten(input => dg.value:timeframes) dgtf

      UNION

      -- Dimension Groups: Durations
      select  v.sha as view_sha,
      v.path as view_path,
      v.name as view_name,
      v.git_owner as git_owner,
      v.git_repository as git_repository,
      v.sql_table_name as sql_table_name,
      'dimension_groups' as field_category,
      -- dg.value::variant as field,
      NULL::variant as actions,
      dg.value:alias::variant as alias,
      dg.value:allow_fill::varchar as allow_fill,
      NULL::variant as allowed_values,
      NULL::varchar as alpha_sort,
      NULL::varchar as approximate,
      NULL::float as approximate_threshold,
      dg.value:bypass_suggest_restrictions::varchar as bypass_suggest_restrictions,
      dg.value:can_filter::varchar as can_filter,
      NULL::variant as case__whens,
      NULL::varchar as case_sensitive,
      dg.value:convert_tz::varchar as convert_tz,
      dg.value:datatype::varchar as datatype,
      NULL::varchar as default_value,
      dg.value:description::varchar as description,
      NULL::varchar as direction,
      dg.value:drill_fields::variant as drill_fields,
      dg.value:fanout_on::varchar as fanout_on,
      NULL::variant as filters,
      dg.value:full_suggestions::varchar as full_suggestions,
      dg.value:group_item_label::varchar as group_item_label,
      dg.value:group_label::varchar as group_label,
      dg.value:hidden::varchar as hidden,
      dg.value:html::varchar as html,
      dgint.value::varchar as "interval",
      CASE WHEN dg.value:label::varchar IS NOT NULL THEN dg.value:label::varchar || ' ' || initcap(dgint.value::varchar)
            ELSE initcap(dgint.value::varchar) END as label,
      COALESCE(dg.value:label::varchar, initcap(replace(dg.value:name::varchar, '_', ' '))) || ' ' || initcap(dgint.value::varchar) as label_displayed,
      NULL::varchar as label_from_parameter,
      NULL::variant as links,
      NULL::varchar as map_layer_name,
      NULL::varchar as list_field,
      dg.value:name::varchar || '_' || lower(dgint.value::varchar) as name,
      dg.value:order_by_field::varchar as order_by_field,
      NULL::float as percentile,
      NULL::int as precision,
      NULL::varchar as primary_key,
      dg.value:required_access_grants::variant as required_access_grants,
      NULL::variant as required_fields,
      dg.value:skip_drill_filter::varchar as skip_drill_filter,
      dg.value:sql::varchar as "sql",
      NULL::varchar as sql_distinct_key,
      dg.value:sql_end::varchar as sql_end,
      NULL::varchar as sql_latitude,
      NULL::varchar as sql_longitude,
      dg.value:sql_start::varchar as sql_start,
      NULL::varchar as style,
      dg.value:suggest_dimension::varchar as suggest_dimension,
      dg.value:suggest_explore::varchar as suggest_explore,
      NULL::varchar as suggest_persist_for,
      dg.value:suggestable::varchar as suggestable,
      NULL::varchar as suggestions,
      dg.value:tags::variant as tags,
      NULL::variant as tiers,
      NULL as timeframe,
      'duration_' || dgint.value::varchar as type,
      NULL::varchar as value_format,
      NULL::varchar as value_format_name,
      dg.value:view_label::varchar as view_label
      from lookml.views v
      , lateral flatten(input => v.dimension_groups) dg
      , lateral flatten(input => dg.value:intervals) dgint

      UNION

      -- Dimensions
      select  v.sha as view_sha,
      v.path as view_path,
      v.name as view_name,
      v.git_owner as git_owner,
      v.git_repository as git_repository,
      v.sql_table_name as sql_table_name,
      'dimensions' as field_category,
      -- d.value::variant as field,
      d.value:actions::variant as actions,
      d.value:alias::variant as alias,
      NULL as allow_fill,
      NULL as allowed_values,
      d.value:alpha_sort::varchar as alpha_sort,
      NULL as approximate,
      NULL as approximate_threshold,
      d.value:bypass_suggest_restrictions::varchar as bypass_suggest_restrictions,
      d.value:can_filter::varchar as can_filter,
      d.value:"case":whens::variant as case__whens,
      d.value:case_sensitive::varchar as case_sensitive,
      d.value:convert_tz::varchar as convert_tz,
      d.value:datatype::varchar as datatype,
      NULL as default_value,
      d.value:description::varchar as description,
      NULL as direction,
      d.value:drill_fields::variant as drill_fields,
      d.value:fanout_on::varchar as fanout_on,
      NULL as filters,
      d.value:full_suggestions::varchar as full_suggestions,
      d.value:group_item_label::varchar as group_item_label,
      d.value:group_label::varchar as group_label,
      d.value:hidden::varchar as hidden,
      d.value:html::varchar as html,
      NULL as interval,
      d.value:label::varchar as label,
      COALESCE(d.value:label::varchar, initcap(replace(d.value:name::varchar, '_', ' '))) as label_displayed,
      d.value:label_from_parameter::varchar as label_from_parameter,
      d.value:links::variant as links,
      d.value:map_layer_name::varchar as map_layer_name,
      NULL as list_field,
      d.value:name::varchar as name,
      d.value:order_by_field::varchar as order_by_field,
      NULL as percentile,
      NULL as precision,
      d.value:primary_key::varchar as primary_key,
      d.value:required_access_grants::variant as required_access_grants,
      d.value:required_fields::variant as required_fields,
      d.value:skip_drill_filter::varchar as skip_drill_filter,
      d.value:sql::varchar as "sql",
      NULL as sql_distinct_key,
      d.value:sql_end::varchar as sql_end,
      d.value:sql_latitude::varchar as sql_latitude,
      d.value:sql_longitude::varchar as sql_longitude,
      d.value:sql_start::varchar as sql_start,
      d.value:style::varchar as style,
      d.value:suggest_dimension::varchar as suggest_dimension,
      d.value:suggest_explore::varchar as suggest_explore,
      d.value:suggest_persist_for::varchar as suggest_persist_for,
      d.value:suggestable::varchar as suggestable,
      d.value:suggestions::variant as suggestions,
      d.value:tags::variant as tags,
      d.value:tiers::variant as tiers,
      NULL as timeframe,
      d.value:type::varchar as "type",
      d.value:value_format::varchar as value_format,
      d.value:value_format_name::varchar as value_format_name,
      d.value:view_label::varchar as view_label
      from lookml.views v
      , lateral flatten(input => v.dimensions) d

      UNION

      -- Measures
      select  v.sha as view_sha,
      v.path as view_path,
      v.name as view_name,
      v.git_owner as git_owner,
      v.git_repository as git_repository,
      v.sql_table_name as sql_table_name,
      'measures' as field_category,
      -- m.value::variant as field,
      m.value:actions::variant as actions,
      m.value:alias::variant as alias,
      NULL as allow_fill,
      NULL as allowed_values,
      NULL as alpha_sort,
      m.value:approximate::varchar as approximate,
      m.value:approximate_threshold::varchar as approximate_threshold,
      NULL as bypass_suggest_restrictions,
      m.value:can_filter::varchar as can_filter,
      NULL as case__whens,
      NULL as case_sensitive,
      m.value:convert_tz::varchar as convert_tz,
      m.value:datatype::varchar as datatype,
      NULL as default_value,
      m.value:description::varchar as description,
      m.value:direction::varchar as direction,
      m.value:drill_fields::variant as drill_fields,
      m.value:fanout_on::varchar as fanout_on,
      m.value:filters::variant as filters,
      NULL as full_suggestions,
      m.value:group_item_label::varchar as group_item_label,
      m.value:group_label::varchar as group_label,
      m.value:hidden::varchar as hidden,
      m.value:html::varchar as html,
      NULL as interval,
      m.value:label::varchar as label,
      COALESCE(m.value:label::varchar, initcap(replace(m.value:name::varchar, '_', ' '))) as label_displayed,
      m.value:label_from_parameter::varchar as label_from_parameter,
      m.value:links::variant as links,
      NULL as map_layer_name,
      m.value:list_field::varchar as list_field,
      m.value:name::varchar as name,
      NULL as order_by_field,
      m.value:percentile::varchar as percentile,
      m.value:precision::varchar as precision,
      NULL as primary_key,
      m.value:required_access_grants::variant as required_access_grants,
      m.value:required_fields::variant as required_fields,
      NULL as skip_drill_filter,
      m.value:sql::varchar as "sql",
      m.value:sql_distinct_key::varchar as sql_distinct_key,
      NULL as sql_end,
      NULL as sql_latitude,
      NULL as sql_longitude,
      NULL as sql_start,
      NULL as style,
      m.value:suggest_dimension::varchar as suggest_dimension,
      m.value:suggest_explore::varchar as suggest_explore,
      NULL as suggest_persist_for,
      m.value:suggestable::varchar as suggestable,
      NULL as suggestions,
      m.value:tags::variant as tags,
      NULL as tiers,
      NULL as timeframe,
      m.value:type::varchar as "type",
      m.value:value_format::varchar as value_format,
      m.value:value_format_name::varchar as value_format_name,
      m.value:view_label::varchar as view_label
      from lookml.views v
      , lateral flatten(input => v.measures) m

      UNION

      -- Filters
      select  v.sha as view_sha,
      v.path as view_path,
      v.name as view_name,
      v.git_owner as git_owner,
      v.git_repository as git_repository,
      v.sql_table_name as sql_table_name,
      'filters' as field_category,
      -- v.filters::variant as fields,
      -- f.value::variant as field,
      NULL as actions,
      f.value:alias::variant as alias,
      NULL as allow_fill,
      NULL as allowed_values,
      NULL as alpha_sort,
      NULL as approximate,
      NULL as approximate_threshold,
      f.value:bypass_suggest_restrictions::varchar as bypass_suggest_restrictions,
      'yes' as can_filter,
      NULL as case__whens,
      f.value:case_sensitive::varchar as case_sensitive,
      f.value:convert_tz::varchar as convert_tz,
      f.value:datatype::varchar as datatype,
      f.value:default_value::varchar as default_value,
      f.value:description::varchar as description,
      NULL as direction,
      NULL as drill_fields,
      NULL as fanout_on,
      NULL as filters,
      f.value:full_suggestions::varchar as full_suggestions,
      f.value:group_item_label::varchar as group_item_label,
      f.value:group_label::varchar as group_label,
      f.value:hidden::varchar as hidden,
      NULL as html,
      NULL as interval,
      f.value:label::varchar as label,
      COALESCE(f.value:label::varchar, initcap(replace(f.value:name::varchar, '_', ' '))) as label_displayed,
      NULL as label_from_parameter,
      NULL as links,
      NULL as map_layer_name,
      NULL as list_field,
      f.value:name::varchar as name,
      NULL as order_by_field,
      NULL as percentile,
      NULL as precision,
      NULL as primary_key,
      f.value:required_access_grants::variant as required_access_grants,
      f.value:required_fields::variant as required_fields,
      NULL as skip_drill_filter,
      f.value:sql::varchar as "sql",
      NULL as sql_distinct_key,
      NULL as sql_end,
      NULL as sql_latitude,
      NULL as sql_longitude,
      NULL as sql_start,
      NULL as style,
      f.value:suggest_dimension::varchar as suggest_dimension,
      f.value:suggest_explore::varchar as suggest_explore,
      f.value:suggest_persist_for::varchar as suggest_persist_for,
      f.value:suggestable::varchar as suggestable,
      f.value:suggestions::variant as suggestions,
      f.value:tags::variant as tags,
      NULL as tiers,
      NULL as timeframe,
      f.value:"type"::varchar as "type",
      NULL as value_format,
      NULL as value_format_name,
      f.value:view_label::varchar as view_label
      from lookml.views v
      , lateral flatten(input => v.filters) f

      UNION

      -- Parameters
      select  v.sha as view_sha,
      v.path as view_path,
      v.name as view_name,
      v.git_owner as git_owner,
      v.git_repository as git_repository,
      v.sql_table_name as sql_table_name,
      'parameters' as field_category,
      -- v.parameters::variant as fields,
      -- p.value::variant as field,
      NULL as actions,
      p.value:alias::variant as alias,
      NULL as allow_fill,
      p.value:allowed_values::variant as allowed_values,
      NULL as alpha_sort,
      NULL as approximate,
      NULL as approximate_threshold,
      p.value:bypass_suggest_restrictions::varchar as bypass_suggest_restrictions,
      'yes' as can_filter,
      NULL as case__whens,
      NULL as case_sensitive,
      p.value:convert_tz::varchar as convert_tz,
      NULL as datatype,
      p.value:default_value::varchar as default_value,
      p.value:description::varchar as description,
      NULL as direction,
      NULL as drill_fields,
      NULL as fanout_on,
      NULL as filters,
      p.value:full_suggestions::varchar as full_suggestions,
      NULL as group_item_label,
      NULL as group_label,
      p.value:hidden::varchar as hidden,
      NULL as html,
      NULL as interval,
      p.value:label::varchar as label,
      COALESCE(p.value:label::varchar, initcap(replace(p.value:name::varchar, '_', ' '))) as label_displayed,
      NULL as label_from_parameter,
      NULL as links,
      NULL as map_layer_name,
      NULL as list_field,
      p.value:name::varchar as name,
      NULL as order_by_field,
      NULL as percentile,
      NULL as precision,
      NULL as primary_key,
      p.value:required_access_grants::variant as required_access_grants,
      p.value:required_fields::variant as required_fields,
      NULL as skip_drill_filter,
      NULL as "sql",
      NULL as sql_distinct_key,
      NULL as sql_end,
      NULL as sql_latitude,
      NULL as sql_longitude,
      NULL as sql_start,
      NULL as style,
      p.value:suggest_dimension::varchar as suggest_dimension,
      p.value:suggest_explore::varchar as suggest_explore,
      p.value:suggest_persist_for::varchar as suggest_persist_for,
      p.value:suggestable::varchar as suggestable,
      p.value:suggestions::variant as suggestions,
      p.value:tags::variant as tags,
      NULL as tiers,
      NULL as timeframe,
      p.value:"type"::varchar as "type",
      NULL as value_format,
      NULL as value_format_name,
      p.value:view_label::varchar as view_label
      from lookml.views v
      , lateral flatten(input => v.parameters) p
       ;;
  }

  dimension: field_key {
    label: "Field Key"
    type: string
    primary_key: yes
    sql: ${view_key} || '-' || ${name} ;;
  }

  dimension: view_field_name {
    label: "View.Field Name"
    type: string
    sql: ${view_name} || '.' || ${name} ;;
  }

  dimension: view_key {
    group_label: "View"
    label: "View Key"
    type: string
    hidden: yes
    sql: ${git_owner} || '-' || ${git_repository} || '-' || ${view_name} ;;
  }

  dimension: view_sha {
    group_label: "View"
    label: "View SHA"
    type: string
    sql: ${TABLE}.VIEW_SHA ;;
  }

  dimension: view_path {
    group_label: "View"
    label: "View Path"
    type: string
    sql: ${TABLE}.VIEW_PATH ;;
  }

  dimension: view_name {
    group_label: "View"
    label: "View Name"
    type: string
    sql: ${TABLE}.VIEW_NAME ;;
  }

  dimension: git_owner {
    group_label: "View"
    label: "Git Owner"
    type: string
    sql: ${TABLE}.GIT_OWNER ;;
  }

  dimension: git_repository {
    group_label: "View"
    label: "Git Repository"
    type: string
    sql: ${TABLE}.GIT_REPOSITORY ;;
  }

  dimension: field_category {
    label: "Field Category"
    type: string
    sql: ${TABLE}.FIELD_CATEGORY ;;
  }

#   dimension: field {
#     label: "Field JSON"
#     type: string
#     sql: ${TABLE}.FIELD ;;
#     hidden: yes
#   }

  dimension: actions {
    group_label: "Actions"
    label: "Actions JSON"
    type: string
    sql: ${TABLE}.ACTIONS ;;
    hidden: yes
  }

  dimension: alias {
    group_label: "Aliases"
    label: "Aliases JSON"
    type: string
    sql: ${TABLE}.ALIAS ;;
    hidden: yes
  }

  dimension: alias_list {
    group_label: "Aliases"
    label: "Aliases List"
    type: string
    sql: array_to_string(parse_json(${alias}), ', ') ;;
  }

  dimension: allow_fill {
    group_label: "Dimension Group Only"
    label: "Allow Fill"
    type: string
    sql: ${TABLE}.ALLOW_FILL ;;
  }

  dimension: allow_fill_yn {
    group_label: "YesNo"
    label: "Allow Fill"
    type: yesno
    sql: ${allow_fill} = 'yes' ;;
  }

  dimension: allowed_values {
    group_label: "Allowed Values"
    label: "Allowed Values JSON"
    type: string
    sql: ${TABLE}.ALLOWED_VALUES ;;
    hidden: yes
  }

  dimension: alpha_sort {
    group_label: "Dimension Only"
    label: "Alpha Sort"
    type: string
    sql: ${TABLE}.ALPHA_SORT ;;
  }

  dimension: alpha_sort_yn {
    group_label: "YesNo"
    label: "Alpha Sort"
    type: yesno
    sql: ${alpha_sort} = 'yes' ;;
  }

  dimension: approximate {
    group_label: "Measure Only"
    label: "Approximate"
    type: string
    sql: ${TABLE}.APPROXIMATE ;;
  }

  dimension: approximate_yn {
    group_label: "YesNo"
    label: "Approximate"
    type: yesno
    sql: ${approximate} = 'yes' ;;
  }

  dimension: approximate_threshold {
    group_label: "Measure Only"
    label: "Approximate Threshold"
    type: number
    sql: ${TABLE}.APPROXIMATE_THRESHOLD  ;;
  }

  dimension: bypass_suggest_restrictions {
    group_label: "Suggest"
    label: "Bypass Suggest Restrictions"
    type: string
    sql: ${TABLE}.BYPASS_SUGGEST_RESTRICTIONS ;;
  }

  dimension: bypass_suggest_restrictions_yn {
    group_label: "YesNo"
    label: "Bypass Suggest Restrictions"
    type: yesno
    sql: ${bypass_suggest_restrictions} = 'yes' ;;
  }

  dimension: can_filter {
    label: "Can Filter"
    type: string
    sql: ${TABLE}.CAN_FILTER ;;
  }

  dimension: can_filter_yn {
    group_label: "YesNo"
    label: "Can Filter"
    type: yesno
    sql: ${can_filter} = 'yes' ;;
  }

  dimension: case__whens {
    group_label: "Dimension Only"
    label: "Case Whens JSON"
    type: string
    sql: ${TABLE}.CASE__WHENS ;;
    hidden: yes
  }

  dimension: case__whens_list {
    group_label: "Dimension Only"
    label: "Case Whens List"
    type: string
    sql: array_to_string(parse_json(${case__whens}), ', ') ;;
  }

  dimension: case_sensitive {
    label: "Case Sensitive"
    type: string
    sql: ${TABLE}.CASE_SENSITIVE ;;
  }

  dimension: case_sensitive_yn {
    group_label: "YesNo"
    label: "Case Sensitive"
    type: yesno
    sql: ${case_sensitive} = 'yes' ;;
  }

  dimension: convert_tz {
    label: "Convert Timezone"
    type: string
    sql: ${TABLE}.CONVERT_TZ ;;
  }

  dimension: convert_tz_yn {
    group_label: "YesNo"
    label: "Convert Timezone"
    type: yesno
    sql: ${convert_tz} = 'yes' ;;
  }

  dimension: datatype {
    label: "Datatype"
    type: string
    sql: ${TABLE}.DATATYPE;;
  }

  dimension: default_value {
    label: "Default Value"
    type: string
    sql: ${TABLE}.DEFAULT_VALUE ;;
  }

  dimension: description {
    label: "Description"
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: direction {
    group_label: "Measure Only"
    label: "Direction"
    type: string
    sql: ${TABLE}.DIRECTION ;;
  }

  dimension: drill_fields {
    group_label: "Drill Fields"
    label: "Drill Fields JSON"
    type: string
    sql: ${TABLE}.DRILL_FIELDS ;;
    hidden: yes
  }

  dimension: drill_fields_list {
    group_label: "Drill Fields"
    label: "Drill Fields List"
    type: string
    sql: array_to_string(parse_json(${drill_fields}), ', ') ;;
  }

  dimension: fanout_on {
    label: "Fanout On"
    type: string
    sql: ${TABLE}.FANOUT_ON ;;
  }

  dimension: filters {
    group_label: "Filters"
    label: "Filters JSON"
    type: string
    sql: ${TABLE}.FILTERS ;;
    hidden: yes
  }

  dimension: full_suggestions {
    group_label: "Suggest"
    label: "Full Suggestions"
    type: string
    sql: ${TABLE}.FULL_SUGGESTIONS ;;
  }

  dimension: full_suggestions_yn {
    group_label: "YesNo"
    label: "Full Suggestions"
    type: yesno
    sql: ${full_suggestions} = 'yes' ;;
  }

  dimension: group_item_label {
    label: "Group Item Lable"
    type: string
    sql: ${TABLE}.GROUP_ITEM_LABEL ;;
  }

  dimension: group_label {
    label: "Group Label"
    type: string
    sql: ${TABLE}.GROUP_LABEL ;;
  }

  dimension: hidden {
    label: "Hidden"
    type: string
    sql: ${TABLE}.HIDDEN ;;
  }

  dimension: hidden_yn {
    group_label: "YesNo"
    label: "Hidden"
    type: yesno
    sql: ${hidden} = 'yes' ;;
  }

  dimension: html {
    label: "HTML"
    type: string
    sql: ${TABLE}.HTML ;;
  }

  dimension: interval {
    group_label: "Dimension Group Only"
    label: "Interval"
    type: string
    sql: ${TABLE}.INTERVAL;;
  }

  dimension: label {
    label: "Label"
    type: string
    sql: ${TABLE}.LABEL ;;
  }

  dimension: label_displayed {
    label: "Label Displayed"
    type: string
    sql: ${TABLE}.LABEL_DISPLAYED ;;
  }

  dimension: label_from_parameter {
    label: "Label from Parameter"
    type: string
    sql: ${TABLE}.LABEL_FROM_PARAMETER ;;
  }

  dimension: links {
    label: "Links JSON"
    type: string
    sql: ${TABLE}.LINKS ;;
    hidden: yes
  }

  dimension: list_field {
    group_label: "Measure Only"
    label: "List Field"
    type: string
    sql: ${TABLE}.LIST_FIELD ;;
  }

  dimension: map_layer_name {
    group_label: "Dimension Only"
    label: "Map Layer Name"
    type: string
    sql: ${TABLE}.MAP_LAYER_NAME ;;
  }

  dimension: name {
    label: "Field Name"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: order_by_field {
    label: "Order by Field"
    type: string
    sql: ${TABLE}.ORDER_BY_FIELD ;;
  }

  dimension: percentile {
    group_label: "Measure Only"
    label: "Percentile"
    type: number
    sql: ${TABLE}.PERCENTILE ;;
  }

  dimension: precision {
    group_label: "Measure Only"
    label: "Precision"
    type: number
    sql: ${TABLE}.PRECISION ;;
  }

  dimension: primary_key {
    group_label: "Dimension Only"
    label: "Primary Key"
    type: string
    sql: ${TABLE}.PRIMARY_KEY  ;;
  }

  dimension: primary_key_yn {
    group_label: "YesNo"
    label: "Primary Key"
    type: yesno
    sql: ${primary_key} = 'yes' ;;
  }

  dimension: required_access_grants {
    group_label: "Required Access Grants"
    label: "Required Access Grants"
    type: string
    sql: ${TABLE}.REQUIRED_ACCESS_GRANTS ;;
    hidden: yes
  }

  dimension: required_access_grants_list {
    group_label: "Required Access Grants"
    label: "Required Access Grants List"
    type: string
    sql: array_to_string(parse_json(${required_access_grants}), ', ') ;;
  }

  dimension: required_fields {
    group_label: "Required Fields"
    label: "Required Fields"
    type: string
    sql: ${TABLE}.REQUIRED_FIELDS ;;
    hidden: yes
  }

  dimension: required_fields_list {
    group_label: "Required Fields"
    label: "Required Fields List"
    type: string
    sql: array_to_string(parse_json(${required_fields}), ', ') ;;
  }

  dimension: skip_drill_filter {
    label: "Skip Drill Filter"
    type: string
    sql: ${TABLE}.SKIP_DRILL_FILTER  ;;
  }

  dimension: skip_drill_filter_yn {
    group_label: "YesNo"
    label: "Skip Drill Filter"
    type: yesno
    sql: ${skip_drill_filter} = 'yes' ;;
  }

  dimension: sql {
    group_label: "SQL"
    label: "SQL"
    type: string
    sql: ${TABLE}.sql ;;
  }

  dimension: sql_distinct_key {
    group_label: "Measure Only"
    label: "SQL Distinct Key"
    type: string
    sql: ${TABLE}.SQL_DISTINCT_KEY ;;
  }

  dimension: sql_end {
    group_label: "SQL"
    label: "SQL End"
    type: string
    sql: ${TABLE}.SQL_END ;;
  }

  dimension: sql_latitude {
    group_label: "Dimension Only"
    label: "SQL Latitude"
    type: string
    sql: ${TABLE}.SQL_LATITUDE ;;
  }

  dimension: sql_longitude {
    group_label: "Dimension Only"
    label: "SQL Longitude"
    type: string
    sql: ${TABLE}.SQL_LONGITUDE ;;
  }

  dimension: sql_start {
    group_label: "SQL"
    label: "SQL Start"
    type: string
    sql: ${TABLE}.SQL_START ;;
  }

  dimension: sql_table_name {
    group_label: "SQL"
    label: "SQL Table Name"
    type: string
    sql: ${TABLE}.SQL_TABLE_NAME ;;
  }

  dimension: db_table_name {
    group_label: "SQL"
    label: "DB Table Name"
    type: string
    sql: SPLIT_PART(${sql_table_name}, '.', -1) ;;
  }

  dimension: db_schema_name {
    group_label: "SQL"
    label: "DB Table Name"
    type: string
    sql: SPLIT_PART(${sql_table_name}, '.', -2) ;;
  }

  dimension: db__name {
    group_label: "SQL"
    label: "DB Table Name"
    type: string
    sql: SPLIT_PART(${sql_table_name}, '.', -3) ;;
  }

  dimension: table_column_name {
    group_label: "SQL"
    label: "Table.Column Name"
    type: string
    sql: REPLACE(COALESCE(${sql}, ${sql_start}, ${sql_end}, ${sql_latitude}, ${sql_longitude},
      ${sql_distinct_key}), '${TABLE}', ${db_table_name}) ;;
  }


  dimension: style {
    group_label: "Dimension Only"
    label: "Style"
    type: string
    sql: ${TABLE}.STYLE ;;
  }

  dimension: suggest_dimension {
    group_label: "Suggest"
    label: "Suggest Dimension"
    type: string
    sql: ${TABLE}.SUGGEST_DIMENSION ;;
  }

  dimension: suggest_explore {
    group_label: "Suggest"
    label: "Suggest Explore"
    type: string
    sql: ${TABLE}.SUGGEST_EXPLORE ;;
  }

  dimension: suggest_persist_for {
    group_label: "Suggest"
    label: "Suggest Persist For"
    type: string
    sql: ${TABLE}.SUGGEST_PERSIST_FOR ;;
  }

  dimension: suggestable {
    group_label: "Suggest"
    label: "Suggestable"
    type: string
    sql: ${TABLE}.SUGGESTABLE ;;
  }

  dimension: suggestions {
    group_label: "Suggest"
    label: "Suggestions"
    type: string
    sql:${TABLE}.SUGGESTIONS ;;
    hidden: yes
  }

  dimension: suggestions_list {
    group_label: "Suggest"
    label: "Suggestions List"
    type: string
    sql: array_to_string(parse_json(${suggestions}), ', ') ;;
  }

  dimension: tags {
    group_label: "Tags"
    label: "Tags JSON"
    type: string
    sql: ${TABLE}.TAGS ;;
    hidden: yes
  }

  dimension: tags_list {
    group_label: "Tags"
    label: "Tags List"
    type: string
    sql: array_to_string(parse_json(${tags}), ', ') ;;
  }

  dimension: tiers {
    group_label: "Dimension Only"
    label: "Tiers JSON"
    type: string
    sql: ${TABLE}.TIERS ;;
    hidden: yes
  }

  dimension: tiers_list {
    group_label: "Dimension Only"
    label: "Tiers List"
    type: string
    sql: array_to_string(parse_json(${tiers}), ', ') ;;
  }

  dimension: timeframe {
    group_label: "Dimension Group Only"
    label: "Timeframe"
    type: string
    sql: ${TABLE}.TIMEFRAME ;;
  }

  dimension: type {
    label: "Field Type"
    type: string
    sql: ${TABLE}.TYPE ;;
  }

  dimension: value_format {
    label: "Value Format"
    type: string
    sql: ${TABLE}.VALUE_FORMAT ;;
  }

  dimension: value_format_name {
    label: "Value Format Name"
    type: string
    sql: ${TABLE}.VALUE_FORMAT_NAME ;;
  }

  dimension: view_label {
    label: "View Label"
    type: string
    sql: ${TABLE}.VIEW_LABEL ;;
  }

  measure: count {
    label: "Number of Fields"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      view_name,
      view_path,
      view_field_name,
      name,
      label,
      group_label,
      field_category,
      type,
      interval,
      timeframe,
      tiers,
      hidden,
      value_format_name,
      hidden
    ]
  }
}
