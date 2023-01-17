CLASS zcl_kindergarten_garden_00 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    data: diagram        TYPE string,
          student        TYPE string,
          results TYPE string_table,
          students TYPE string_table.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_kindergarten_garden_00 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

      diagram = 'VVCG\nVVRC' .
      student = 'Bob' .
      students = value #( ( |Alice| )
                        ( |Bob| )
                        ( |Charlie| )
                        ( |David| )
                        ( |Eve| )
                        ( |Fred| )
                        ( |Ginny| )
                        ( |Harriet| )
                        ( |Ileana| )
                        ( |Joseph| )
                        ( |Kincaid| )
                        ( |Larry| )
).
split diagram at '\n' into data(plant_row_1) data(plant_row_2) in character mode.
read table students WITH TABLE KEY table_line = student TRANSPORTING NO FIELDS.
    data(first_pos) = ( SY-TABIX * 2 ) - 2.
    data(second_pos) = ( SY-TABIX * 2 ) - 1.

    append plant_row_1+first_pos(1) to results.
    append plant_row_1+second_pos(1) to results.
    append plant_row_2+first_pos(1) to results.
    append plant_row_2+second_pos(1) to results.

  LOOP AT results assigning field-symbol(<result>).
    case <result>.
      when 'C'.
        <result> = |clover|.
      when 'G'.
        <result> = |grass|.
      when 'R'.
        <result> = |radishes|.
      when 'V'.
        <result> = |violets|.
    endcase.
  ENDLOOP.

  out->write( data = results ).
  ENDMETHOD.
ENDCLASS.
