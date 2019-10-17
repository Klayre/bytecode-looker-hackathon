connection: "snowflake_stitch"

include: "/**/*.view"

map_layer: identifier {
  # extents_json_url: "URL to JSON extents file"
  feature_key: "Name of TopoJSON object"
  file: "/lkml/africa_map_layer.topojson"
  format: topojson
  label: "Label I want"
  # max_zoom_level: 10
  # min_zoom_level: 5
  projection: cartesian
  property_key: "TopoJSON property"
  property_label_key: "Label for TopoJSON property"
  # url: "URL that contains map file"
}

named_value_format: dollars {
  value_format: "$#,##0.00"
}

datagroup: datagroup_name {
  sql_trigger: SQL query ;;
  max_cache_age: "24 hours"
}

access_grant: access_grant_name {
  user_attribute: test
  allowed_values: ["value_1", "value_2"]
}

explore: model_files {
  join: models {
    relationship: one_to_one
    sql_on: ${model_files.model_file_pk} = ${model_files.model_file_pk} ;;
  }
}
