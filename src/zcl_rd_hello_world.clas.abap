CLASS zcl_rd_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES: IF_OO_ADT_CLASSRUN.
  METHODS: M1.
  METHODS: M2.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RD_HELLO_WORLD IMPLEMENTATION.


  METHOD m1.

  ENDMETHOD.


  METHOD m2.

  ENDMETHOD.


method:IF_OO_ADT_CLASSRUN~main.

out->write( 'Hello World' ).
ENDMETHOD.
ENDCLASS.
