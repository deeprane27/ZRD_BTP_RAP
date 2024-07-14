@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Interaface view'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_RD_BOOK_BS
  as select from zrd_book_bs as Booking
  
  association to parent ZI_rd_trav_bs     as _Travel     on  $projection.TravelUuid = _Travel.TravelUuid
  association [0..1] to /DMO/I_Customer   as _CUSTOMER   on  $projection.CustomerId = _CUSTOMER.CustomerID
  association [0..1] to /DMO/I_Carrier    as _CARRIER    on  $projection.CarrierId = _CARRIER.AirlineID
  association [0..1] to /DMO/I_Connection as _CONNECTION on  $projection.CarrierId    = _CONNECTION.AirlineID
                                                         and $projection.ConnectionId = _CONNECTION.ConnectionID
  association [0..1] to /DMO/I_Flight     as _FLIGHT     on  $projection.CarrierId    = _FLIGHT.AirlineID
                                                         and $projection.ConnectionId = _FLIGHT.ConnectionID
                                                         and $projection.FlightDate   = _FLIGHT.FlightDate
  association [0..1] to I_Currency        as _currency   on  $projection.CurrencyCode = _currency.Currency
{
  key booking_uuid          as BookingUuid,
      travel_uuid           as TravelUuid,
      travel_id             as TravelId,
      booking_id            as BookingId,
      booking_date          as BookingDate,
      customer_id           as CustomerId,
      carrier_id            as CarrierId,
      connection_id         as ConnectionId,
      flight_date           as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price          as FlightPrice,
      currency_code         as CurrencyCode,
      @Semantics.user.createdBy: true
      createdby             as Createdby,
      @Semantics.systemDateTime.createdAt: true
      createdat             as Createdat,
      @Semantics.user.lastChangedBy: true
      lastchangedby         as Lastchangedby,
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat         as Lastchangedat,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      /* Association */
      _CUSTOMER,
      _CARRIER,
      _CONNECTION,
      _FLIGHT,
      _currency,
      _Travel 
}
