CLASS zcl_select_inline DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_select_inline IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF st_airport,
             airportid TYPE /dmo/airport_id,
             name      TYPE /dmo/airport_name,
           END OF st_airport.

    TYPES tt_airports TYPE STANDARD TABLE OF st_airport
                          WITH NON-UNIQUE KEY airportid.

    DATA: airports TYPE tt_airports,
          airport_full TYPE /DMO/I_Airport,
          airports_full TYPE STANDARD TABLE OF /DMO/I_Airport WITH NON-UNIQUE KEY AirportID.


* Example 1: Structured Variables in SELECT SINGLE ... INTO ...
**********************************************************************
    SELECT SINGLE
      FROM /DMO/I_Airport
    FIELDS AirportID, Name, City, CountryCode
     WHERE City = 'Zurich'
      INTO @airport_full.

    out->write(  `-------------------------------------` ).
    out->write(  `Example 1: SELECT SINGLE ... INTO ...` ).
    out->write(  data = airport_full
                 name = `One of the airports in Zurich (Structure):` ).

* Example 2: Internal Tables in SELECT ... INTO TABLE ...
**********************************************************************

    SELECT
      FROM /DMO/I_Airport
    FIELDS airportid, Name, City, CountryCode
     WHERE City = 'London'
      INTO TABLE @airports_full.

    out->write(  `------------------------------------` ).
    out->write(  `Example 2: SELECT ... INTO TABLE ...` ).
    out->write(  data = airports_full
                 name = `All airports in London (Internal Table):` ).

* Example 3: FIELDS * and INTO CORRESPONDING FIELDS OF TABLE
**********************************************************************

    SELECT
      FROM /DMO/I_Airport
    FIELDS *
     WHERE City = 'London'
      INTO CORRESPONDING FIELDS OF TABLE @airports.

    out->write(  `----------------------------------------------------------` ).
    out->write(  `Example 3: FIELDS * and INTO CORRESPONDING FIELDS OF TABLE` ).
    out->write(  data = airports
                 name = `Internal Table AIRPORTS:` ).

* Example 4: Inline Declaration
**********************************************************************

    SELECT
      FROM /DMO/I_airport
    FIELDS AirportID, Name AS AirportName
     WHERE City = 'London'
     INTO TABLE @DATA(airports_inline).

    out->write(  `----------------------------------------------------------` ).
    out->write(  `Example 4: Inline Declaration after INTO TABLE` ).
    out->write(  data = airports_inline
                 name = `Internal Table AIRPORTS_INLINE:` ).

* Example 5: ORDER BY and DISTINCT
**********************************************************************

    SELECT
      FROM /DMO/I_Airport
    FIELDS DISTINCT CountryCode
     ORDER BY CountryCode
     INTO TABLE @DATA(countryCodes).

    out->write(  `----------------------------------------------` ).
    out->write(  `Example 5: Order by and Distinct ` ).
     out->write(  data = countryCodes
                 name = `Order by and Distinct Country codes:` ).

* Example 6: UNION (ALL)
**********************************************************************

    SELECT FROM /DMO/I_Carrier
           FIELDS 'Airline' AS type, AirlineID AS Id, Name
           WHERE CurrencyCode = 'GBP'

    UNION ALL

    SELECT FROM /DMO/I_Airport
           FIELDS 'Airport' AS type, AirportID AS Id,  Name
           WHERE City = 'London'
    ORDER BY type, Id
    INTO TABLE @DATA(names).

    out->write(  `----------------------------------------------` ).
    out->write(  `Example 6: UNION ALL of Airlines and Airports ` ).
    out->write(  data = names
                 name = `ID and Name of Airlines and Airports:` ).



  ENDMETHOD.
ENDCLASS.
