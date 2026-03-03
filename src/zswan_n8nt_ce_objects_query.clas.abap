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

     " 1. Filter auslesen
    DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).

    " PackageName-Filter ermitteln
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

    " 2. Daten holen – pro Paket die Methode aufrufen
    DATA: lt_result TYPE STANDARD TABLE OF zswan_n8nt_ce_objects.

    LOOP AT lr_package INTO DATA(ls_package).

      DATA(lt_contents) = zswan_n8nt=>get_all_package_contents(
                             iv_package = CONV #( ls_package-low ) ).

      " 3. Ergebnis auf Custom-Entity-Struktur mappen
      LOOP AT lt_contents INTO DATA(ls_content).
        APPEND VALUE #(
          name        = ls_content-obj_name
          type        = ls_content-obj_type
          packagename = ls_content-package
          masterlanguage = ls_content-masterlang
        ) TO lt_result.
      ENDLOOP.

    ENDLOOP.

    " 4. Sortierung anwenden (falls vom Consumer angefordert)
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

    " 5. Gesamtanzahl setzen (falls angefordert)
    DATA(lv_total_count) = lines( lt_result ).

    "IF io_request->is_total_numb_of_rec_requested( ).
    "  io_response->set_total_number_of_records( lv_total_count ).
    "ENDIF.

    " 6. Paging anwenden
    DATA(lv_offset) = io_request->get_paging( )->get_offset( ).
    DATA(lv_page_size) = io_request->get_paging( )->get_page_size( ).

*    IF lv_page_size > 0.
*      DATA(lv_max) = lv_offset + lv_page_size.
*      IF lv_max > lv_total_count.
*        lv_max = lv_total_count.
*      ENDIF.
*
*      lt_result = VALUE #(
*        FOR i = lv_offset + 1 WHILE i <= lv_max
*        ( lt_result[ i ] ) ).
*    ENDIF.

    " 7. Ergebnis zurückgeben
    io_response->set_data( lt_result ).


  ENDMETHOD.
ENDCLASS.
