CLASS zcl_phone_no_00 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: number type string,
          result  TYPE string.


    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_phone_no_00 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA(number) = '(223) 456-7890'.
    result = replace( val = number regex = '[^\d]' with = '' occ = 0 ).
    condense result no-gaps.
    if result+0(1) = 1 and strlen( result ) = 11 .
        replace result+0(1) in result with '' .
        condense result no-gaps.
    endif.
    if ( find( val = result regex = '[2-9]\d{2}[2-9]\d{6}$' ) < 0 ).
      raise exception type cx_parameter_invalid.
    endif.

    out->write( result ).

  ENDMETHOD.


ENDCLASS.
