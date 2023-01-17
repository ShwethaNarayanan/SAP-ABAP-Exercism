CLASS zcl_isogram_ DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  data result type abap_bool.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_isogram_ IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
data(phrase) = 'Alphabet'.
 data(l_phrase) = to_lower( val = phrase ).

    result = REDUCE #( INIT lv_iso = abap_true
                       FOR i = 0 until i = strlen( l_phrase )
                       NEXT lv_iso = COND #( WHEN l_phrase+i(1) = ' ' or l_phrase+i(1) = '-'
                                                  THEN lv_iso
                                             WHEN COUNT( val = l_phrase
                                                         sub = l_phrase+i(1) ) > 1
                                                  THEN abap_false
                                              ELSE lv_iso ) ).
    out->write( result ).

  ENDMETHOD.
ENDCLASS.
