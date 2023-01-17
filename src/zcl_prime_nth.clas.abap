CLASS zcl_prime_nth DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: result  TYPE i,
          l_prime TYPE i.

    METHODS is_prime
      IMPORTING
        in         TYPE i
      RETURNING
        VALUE(out) TYPE i .
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_prime_nth IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(ind) = 2.
    DATA(input) = 36.
    l_prime = 1.
    WHILE l_prime <= input.
      result = is_prime( ind ).
      ind += 1.
    ENDWHILE.
    out->write( result ).
  ENDMETHOD.

  METHOD is_prime.
    DATA(cnt) = 2.
    WHILE cnt < in.
      IF in MOD cnt = 0.
        out = 0.
        RETURN.
      ENDIF.
      cnt += 1.
    ENDWHILE.
    l_prime += 1.
    out = in.
  ENDMETHOD.

ENDCLASS.
