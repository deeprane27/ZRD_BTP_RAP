@EndUserText.label: 'Travel projection view'
@Search.searchable: true                                // Filter option enable in projrction view    
@ObjectModel.semanticKey: [ 'TravelId' ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_RD_TRAV_BS
provider contract transactional_query
  as projection on ZI_rd_trav_bs
{
  key TravelUuid,
      @Search.defaultSearchElement: true                // Filter option - search Enable
      TravelId,
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element: 'AgencyID' } }]   // F4 Help
      @ObjectModel.text.element: [ 'AgencyName' ]       // Instead of ID name of agency will appear
      AgencyId,
      _Agency.Name        as AgencyName,
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID' } }]   // F4 Help database table field name
      @ObjectModel.text.element: [ 'CustomerName' ] // Instead of ID name of agency will appear
      CustomerId,
      _customer.FirstName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency' }, useForValidation: true }]
      CurrencyCode,
      Description,
      Status,
      OverallStatusCriticality,
      Lastchangedat,
      LocalLastChangedAt,
      /* Associations */
      _Agency,
      _currency,
      _customer,
      _Booking: redirected to composition child ZC_RD_book_BS 
}
