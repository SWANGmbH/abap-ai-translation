CLASS zswan_n8nt_ce_objects_query DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zswan_n8nt_ce_objects_query IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

    DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).

    DATA: lr_package TYPE RANGE OF devclass.

    LOOP AT lt_filter_cond INTO DATA(ls_filter_cond)
         WHERE name = 'PACKAGENAME'.
      LOOP AT ls_filter_cond-range INTO DATA(ls_range).
        APPEND VALUE #(
          sign   = ls_range-sign
          option = ls_range-option
          low    = ls_range-low
          high   = ls_range-high
        ) TO lr_package.
      ENDLOOP.
    ENDLOOP.

    DATA: lt_result TYPE STANDARD TABLE OF zswan_n8nt_ce_package_contents.

    LOOP AT lr_package INTO DATA(ls_package).

      DATA(lt_contents) = zswan_n8nt_controller=>get_all_package_contents( iv_package = ls_package-low ).

      LOOP AT lt_contents INTO DATA(ls_content).
        APPEND VALUE #(
          name        = ls_content-obj_name
          type        = ls_content-obj_type
          packagename = ls_content-package
          masterlanguage = ls_content-masterlang
        ) TO lt_result.
      ENDLOOP.

    ENDLOOP.

    DATA(lv_total_count) = lines( lt_result ).
    io_response->set_total_number_of_records( CONV #( lv_total_count ) ).

    DATA(lv_offset)    = io_request->get_paging( )->get_offset( ).
    DATA(lv_page_size) = io_request->get_paging( )->get_page_size( ).

    IF lv_page_size > 0.
      DATA(lv_max_index) = lv_offset + lv_page_size.

      IF lv_max_index < lv_total_count.
        DELETE lt_result FROM ( lv_max_index + 1 ).
      ENDIF.
    ENDIF.

    IF lv_offset > 0.
      DELETE lt_result FROM 1 TO lv_offset.
    ENDIF.

    io_response->set_data( lt_result ).

  ENDMETHOD.
ENDCLASS.
