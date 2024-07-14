CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS acceptTravel FOR MODIFY
      IMPORTING keys FOR ACTION Travel~acceptTravel.

    METHODS rejectTravel FOR MODIFY
      IMPORTING keys FOR ACTION Travel~rejectTravel.
    METHODS setinitialstatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Travel~setinitialstatus.

ENDCLASS.

CLASS lhc_Travel IMPLEMENTATION.

  METHOD acceptTravel.
    MODIFY ENTITIES OF ZI_rd_trav_bs IN LOCAL MODE
    ENTITY Travel
    UPDATE  FIELDS ( Status )
              WITH VALUE #( FOR ls_key IN keys ( %tky = ls_key-%tky
                                                 Status = 'A' ) )
      FAILED DATA(rs_failed)
      REPORTED DATA(rs_reported).
  ENDMETHOD.

  METHOD rejectTravel.
    MODIFY ENTITIES OF ZI_rd_trav_bs IN LOCAL MODE
    ENTITY Travel
    UPDATE  FIELDS ( Status )
              WITH VALUE #( FOR ls_key IN keys ( %tky = ls_key-%tky
                                                 Status = 'X' ) )
      FAILED DATA(rs_failed)
      REPORTED DATA(rs_reported).

  ENDMETHOD.

  METHOD setinitialstatus.

*    MODIFY ENTITIES OF ZI_rd_trav_bs IN LOCAL MODE
*    ENTITY Travel
*    UPDATE  FIELDS ( Status )
*              WITH VALUE #( FOR ls_key IN keys ( %tky = ls_key-%tky
*                                                 Status = 'O' ) )
*      FAILED DATA(rs_failed)
*      REPORTED DATA(rs_reported).


    MODIFY ENTITIES OF ZI_rd_trav_bs IN LOCAL MODE
    ENTITY Travel
    UPDATE FIELDS ( status )
             WITH VALUE #( FOR ls_key IN keys ( %tky = ls_key-%tky
                                                status = 'O' ) )
           FAILED DATA(rs_failed)
         REPORTED DATA(rs_reported).

  ENDMETHOD.

ENDCLASS.
