CLASS zcl_rd_eml_demo_bs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: new_variable TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.



CLASS ZCL_RD_EML_DEMO_BS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    out->write( 'Before Update' ).
    out->write( '=====================================================================================  ' ).

    READ ENTITIES OF ZI_rd_trav_bs           " Reading it from BO
              ENTITY Travel                  " Entity
            " FIELDS ( AgencyId BeginDate BookingFee )    " Selected field set
                 ALL FIELDS
                WITH VALUE #( ( TravelUuid = 'F05B4FA0799075DB1800133A36269004' ) )        " travel id you want to read from BO
              RESULT DATA(rs_travel)
              FAILED DATA(rs_failed)
              REPORTED DATA(rs_reported).

    MODIFY ENTITIES OF ZI_rd_trav_bs
             ENTITY Travel
             CREATE

             SET FIELDS WITH VALUE #( ( %cid = 'ID_1'
                                        TravelId = '202'
                                        AgencyId = '070007'
                                        CustomerId = '000225'
                                        begindate = cl_abap_context_info=>get_system_date( )
                                        enddate = cl_abap_context_info=>get_system_date( ) + 5
                                        Description = 'Creating New trip to Adman'
                                    ) ).
    COMMIT ENTITIES
           RESPONSE OF ZI_rd_trav_bs  FAILED DATA(failed_data).

    READ ENTITIES OF ZI_rd_trav_bs
              ENTITY Travel BY \_Booking
                 ALL FIELDS
                WITH VALUE #( ( TravelUuid = 'F05B4FA0799075DB1800133A36269004' ) )
              RESULT DATA(rs_bookings).

    out->write( rs_travel ).
    out->write( rs_bookings ).



  ENDMETHOD.
ENDCLASS.
