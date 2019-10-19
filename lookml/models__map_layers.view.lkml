view: models__map_layers {
  view_label: "Models"
#     sql:  select  m.sha as model_sha,
#                   m.path as model_path,
#                   m.map_layers,
#                   ml.value:extents_json_url::varchar as extents_json_url,
#                   ml.value:feature_key::varchar as feature_key,
#                   ml.value:"file"::varchar  as "file",
#                   ml.value:format::varchar  as format,
#                   ml.value:label::varchar  as label,
#                   ml.value:max_zoom_level::varchar  as max_zoom_level,
#                   ml.value:min_zoom_level::varchar  as min_zoom_level,
#                   ml.value:name::varchar  as name,
#                   ml.value:projection::varchar  as projection,
#                   ml.value:property_key::varchar  as property_key,
#                   ml.value:property_label_key::varchar  as property_label_key,
#                   ml.value:url::varchar  as url
#           from lookml.models m
#           , lateral flatten(input => m.map_layers) ml ;;

  dimension: map_layers_pk {
    group_label: "Map Layers"
    label: "Map Layers PK"
    type: string
    primary_key: yes
    sql: ${models.model_pk} || '-' ${name} ;;
    hidden: yes
  }

  dimension: extents_json_url {
    group_label: "Map Layers"
    label: "Extents JSON URL"
    type: string
    sql: ml.value:extents_json_url::varchar ;;
  }

  dimension: feature_key {
    group_label: "Map Layers"
    label: "Feature Key"
    type: string
    sql: ml.value:feature_key::varchar ;;
  }

  dimension: file {
    group_label: "Map Layers"
    label: "File"
    type: string
    sql: ml.value:"file"::varchar  ;;
  }

  dimension: format {
    group_label: "Map Layers"
    label: "Format"
    type: string
    sql: ml.value:format::varchar ;;
  }

  dimension: label {
    group_label: "Map Layers"
    label: "Label"
    type: string
    sql: ml.value:label::varchar ;;
  }

  dimension: max_zoom_level {
    group_label: "Map Layers"
    label: "Max Zoom Level"
    type: string
    sql: ml.value:max_zoom_level::varchar ;;
  }

  dimension: min_zoom_level {
    group_label: "Map Layers"
    label: "Min Zooom Level"
    type: string
    sql: ml.value:min_zoom_level::varchar ;;
  }

  dimension: name {
    group_label: "Map Layers"
    label: "Map Layer Name"
    type: string
    sql: ml.value:name::varchar ;;
  }

  dimension: projection {
    group_label: "Map Layers"
    label: "Projection"
    type: string
    sql: ml.value:projection::varchar ;;
  }

  dimension: property_key {
    group_label: "Map Layers"
    label: "Property Key"
    type: string
    sql: ml.value:property_key::varchar;;
  }

  dimension: property_label_key {
    group_label: "Map Layers"
    label: "Property Label Key"
    type: string
    sql: ml.value:property_label_key::varchar  ;;
  }

  dimension: url {
    group_label: "Map Layers"
    label: "Map Layer URL"
    type: string
    sql: ml.value:url::varchar  ;;
  }

  measure: count {
    label: "Number of Map Layers"
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      model_files.model_name,
      name,
      label,
      file,
      format,
      projection,
      url
    ]
  }
}
