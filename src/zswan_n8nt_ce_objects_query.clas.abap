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

    DATA(lt_sort) = io_request->get_sort_elements( ).
    IF lt_sort IS NOT INITIAL.
      DATA(lt_sort_dyn) = VALUE abap_sortorder_tab(
        FOR ls_sort IN lt_sort
        ( name = ls_sort-element_name
          descending = COND #( WHEN ls_sort-descending = abap_true
                               THEN abap_true
                               ELSE abap_false ) ) ).
      SORT lt_result BY (lt_sort_dyn).
    ENDIF.

    DATA(lv_total_count) = lines( lt_result ).

    DATA(lv_offset) = io_request->get_paging( )->get_offset( ).
    DATA(lv_page_size) = io_request->get_paging( )->get_page_size( ).

    io_response->set_data( lt_result ).


  ENDMETHOD.
ENDCLASS.
