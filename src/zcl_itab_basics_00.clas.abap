CLASS zcl_itab_basics_00 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_itab_basics_00 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.
    DATA: initial_data TYPE itab_data_type,
           result_index type i.

    initial_data = VALUE #( ( group = 'A'  number  = 10  description  = 'Group A-2' )
                                    ( group = 'B'  number  = 5  description  = 'Group B' )
                                    ( group = 'A'  number  = 6  description  = 'Group A-1' )
                                    ( group = 'C'  number  = 22  description  = 'Group C-1' )
                                    ( group = 'A'  number  = 13  description  = 'Group A-3' )
                                    ( group = 'C'  number  = 500  description  = 'Group C-2' )
                                  ).


    "Append a record to the internal table
    APPEND VALUE #( group = 'A'  number  = 19  description  = 'Group A-4' ) TO initial_data.

    "Sort the internal table GROUP column in alphabetical order and the NUMBER column in descending order
    SORT initial_data BY group ASCENDING number DESCENDING.

    "Search the internal table for record with NUMBER column value of 6
     result_index = line_index( initial_data[ number = 6 ] ).

     out->write( initial_data ).
     out->write( result_index ).

  ENDMETHOD.
ENDCLASS.
