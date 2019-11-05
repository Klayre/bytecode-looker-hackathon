view: x_view_fields_db_columns {

  dimension: is_data_type_match {
    sql:  CASE WHEN UPPER(${views__fields.type}) = UPPER(${columns.data_type}) THEN 'yes'
               WHEN ${views__fields.type} = 'string' AND UPPER(${columns.data_type}) = 'TEXT' THEN 'yes'
               WHEN LEFT( ${views__fields.type}, 4) = 'date'AND UPPER(${columns.data_type}) = 'DATE' THEN 'yes'
               WHEN LEFT( ${views__fields.type}, 4) = 'date'AND UPPER(${columns.data_type}) = 'TIMESTAMP_LTZ' THEN 'yes'
               WHEN LEFT( ${views__fields.type}, 4) = 'date'AND UPPER(${columns.data_type}) = 'TIMESTAMP_NTZ' THEN 'yes'
               WHEN ${views__fields.type} = 'yesno'AND UPPER(${columns.data_type}) = 'BOOLEAN' THEN 'yes'
          ELSE 'no' END ;;

  }

 }
