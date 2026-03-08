CLASS zswan_n8nt_ce_method_src_query DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zswan_n8nt_ce_method_src_query IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

    DATA(lt_filter_cond) = io_request->get_filter( )->get_as_ranges( ).

    DATA(lv_classname) = CONV seoclsname( lt_filter_cond[ name = 'CLASSNAME' ]-range[ 1 ]-low ).
    DATA(lv_methodname) = CONV seocpdname( lt_filter_cond[ name = 'METHODNAME' ]-range[ 1 ]-low ).

    DATA(lo_n8n) = NEW zswan_n8nt_controller( ).
    DATA(lv_source) = lo_n8n->get_class_method_source( EXPORTING iv_class_name = lv_classname
                                     iv_component_name = lv_methodname ).

    DATA lt_result TYPE TABLE OF zswan_n8nt_ce_method_source.

    APPEND INITIAL LINE TO lt_result ASSIGNING FIELD-SYMBOL(<ls_result>).

    <ls_result>-classname = lv_classname.
    <ls_result>-methodname = lv_methodname.
    <ls_result>-SourceCode = lv_source.

    io_response->set_total_number_of_records( lines( lt_result ) ).
    io_response->set_data( lt_result ).

  ENDMETHOD.
ENDCLASS.
