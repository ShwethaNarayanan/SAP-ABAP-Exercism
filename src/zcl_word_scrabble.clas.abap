CLASS zcl_word_scrabble DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_word_scrabble IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(u_input) = to_upper( val = 'a' ).

  DATA(result) = REDUCE #( INIT sum = 0
                       FOR i = 0 UNTIL i = strlen( u_input )
                       NEXT sum = sum + COND #(
                        WHEN u_input+i(1) CA 'AEIOULNRST' THEN 1
                        WHEN u_input+i(1) CA 'DG' THEN 2
                        WHEN u_input+i(1) CA 'BCMP' THEN 3
                        WHEN u_input+i(1) CA 'FHVWY' THEN 4
                        WHEN u_input+i(1) CA 'K' THEN 5
                        WHEN u_input+i(1) CA 'JX' THEN 8
                        WHEN u_input+i(1) CA 'QZ' THEN 10
                        ELSE 0
                       ) ).

   data(result1) = | One for { COND string( when u_input is initial then 'you'
                                      else u_input ) }, one for me |.

    out->write( result1 ).

  ENDMETHOD.
ENDCLASS.
