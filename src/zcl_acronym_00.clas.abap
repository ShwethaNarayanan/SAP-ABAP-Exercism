CLASS zcl_acronym_00 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: phrase type string,
           acronym type string.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_acronym_00 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    phrase = `The Road _Not_ Taken`.
    phrase = replace( val = phrase regex = '-' with = | | occ = 0 ).
    phrase = replace( val = phrase regex = '[_@!$%]' with = '' occ = 0 ).
    split phrase at space into table data(lt_acronym).

    loop at lt_acronym assigning field-symbol(<fs_acronym>).
      acronym = acronym && <fs_acronym>+0(1).
    endloop.
    acronym = to_upper( val = acronym ).
    out->write( acronym ).

  ENDMETHOD.
ENDCLASS.
