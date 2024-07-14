@EndUserText.label: 'Booking Projection view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZC_RD_BOOK
  provider contract transactional_query
  as projection on ZI_RD_BOOK_BS as booking
{
  key BookingUuid,
      TravelUuid,
      TravelId,
      @Search.defaultSearchElement: true
      BookingId,
      BookingDate,
      @Search.defaultSearchElement: true
      // @EndUserText.label: 'Customer'
      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Customer' , element: 'CustomerID' } }]
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _CUSTOMER.FirstName as customerName,
      // @EndUserText.label: 'Airline'
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Carrier' , element: 'AirlineID'  } }]
      @ObjectModel.text.element:[ 'AirlineName' ]
      CarrierId,
      _CARRIER.Name       as AirlineName,
      @Search.defaultSearchElement: true
     // @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Connection', element: 'ConnectionID'  } ,
     //  additionalBinding: [{ localElement: 'CarrierId', element: 'AirlineID' },
    //                        { localElement: 'FlightDate', element: 'FlightDate' },
    //                       { localElement: 'FlightPrice', element: 'Price'},
    //                        { localElement: 'CurrencyCode', element: 'CurrencyCode' }] }]
      @ObjectModel.text.element: [ 'AirlineName'  ]
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name : 'I_Currency' , element: 'Currency'} }]
      CurrencyCode,
      LocalLastChangedAt,
      /* Associations */
      _CARRIER,
      _CONNECTION,
      _currency,
      _CUSTOMER,
      _FLIGHT

}
