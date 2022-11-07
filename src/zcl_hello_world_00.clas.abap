CLASS zcl_hello_world_00 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
ENDCLASS.

CLASS zcl_hello_world_00 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write( | Hello, World!| ).
  ENDMETHOD.
ENDCLASS.
