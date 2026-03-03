CLASS zswan_n8nt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

   TYPES: BEGIN OF ty_ai_doc_object,
             obj_type TYPE trobjtype,
             obj_name TYPE sobj_name,
             package  TYPE devclass,
             masterlang TYPE spras,
           END OF ty_ai_doc_object,
           tt_ai_doc_objects TYPE STANDARD TABLE OF ty_ai_doc_object
                             WITH DEFAULT KEY.

    CLASS-METHODS get_all_package_contents
      IMPORTING
        !iv_package        TYPE devclass
      RETURNING
        VALUE(rt_contents) TYPE tt_ai_doc_objects .

    CLASS-METHODS get_all_packages
      IMPORTING
        !iv_package        TYPE devclass
      RETURNING
        VALUE(rt_packages) TYPE gakh_t_tdevc .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zswan_n8nt IMPLEMENTATION.

  METHOD get_all_packages.

    DATA: lt_subpkgs  TYPE TABLE OF tdevc,
          lv_subpkg   TYPE devclass,
          lt_all_pkgs TYPE TABLE OF tdevc.

    CLEAR: rt_packages.

    SELECT SINGLE * FROM tdevc
        WHERE devclass = @iv_package
        INTO @DATA(ls_package).

    APPEND ls_package TO lt_all_pkgs.

    SELECT * FROM tdevc
      INTO TABLE @lt_subpkgs
      WHERE parentcl = @iv_package.

    LOOP AT lt_subpkgs INTO lv_subpkg.
      APPEND LINES OF zswan_cl_ai_doc=>get_all_packages( lv_subpkg ) TO lt_all_pkgs.
    ENDLOOP.

    rt_packages = lt_all_pkgs.

  ENDMETHOD.

  METHOD get_all_package_contents.

    DATA(lt_packages) = zswan_cl_ai_doc=>get_all_packages( iv_package ).

    CLEAR: rt_contents.

    LOOP AT lt_packages INTO DATA(ls_package).

      SELECT * FROM tadir
        INTO TABLE @DATA(lt_objects)
        WHERE devclass = @ls_package-devclass
        AND delflag = ''
        AND pgmid = 'R3TR'.

      LOOP AT lt_objects INTO DATA(ls_object).

        APPEND INITIAL LINE TO rt_contents ASSIGNING FIELD-SYMBOL(<fs_content>).
        <fs_content>-obj_name = ls_object-obj_name.
        <fs_content>-obj_type = ls_object-object.
        <fs_content>-package = ls_object-devclass.
        <fs_content>-masterlang = ls_object-masterlang.

      ENDLOOP.

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
