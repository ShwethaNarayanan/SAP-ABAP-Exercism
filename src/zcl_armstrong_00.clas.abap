CLASS zcl_armstrong_00 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    data: num type i,
          l_num type string,
          l_armstrong type i,
          result type abap_bool.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_armstrong_00 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    num = 153.
    l_num = num.
    CONDENSE l_num no-gaps.

    l_armstrong = REDUCE #( INIT arm = 0
                            FOR i = 0 UNTIL i = strlen( l_num )
                            NEXT arm += ipow( base = l_num+i(1) exp = strlen( l_num ) ) ).
    IF l_armstrong = num.
      result = abap_true.
    ELSE.
      result = abap_false.
    ENDIF.

    out->write( l_armstrong ).
    out->write( result ).

  ENDMETHOD.
ENDCLASS.
