@EndUserText.label: 'Travel projection view'
@Search.searchable: true                                // Filter option enable in projrction view
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.semanticKey: [ 'TravelId' ]
@Metadata.allowExtensions: true
define root view entity ZC_RD_TRAV
  provider contract transactional_query
  as projection on ZI_rd_trav_bs 
{
  key TravelUuid,
      @Search.defaultSearchElement: true // Filter option - search Enable
      TravelId,
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency', element: 'AgencyID' } }]    // F4 Help
      @ObjectModel.text.element: [ 'AgencyName' ]           // Instead of ID name of agency will appear
      @EndUserText.label: 'Global Agency'                   // Changing the column heading
      AgencyId,
      _Agency.Name        as AgencyName,
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID' } }] // F4 Help database table field name
      // @ObjectModel.text.element: [ 'CustomerName' ]         // Along With of ID name of agency will appear
      CustomerId,
      _customer.FirstName as CustomerName,                     // For @objectModel annotation required so that id will be display with customer name
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      @Search.defaultSearchElement: true
      Description,
      Status,
      Lastchangedat,
      LocalLastChangedAt,
      /* Associations */
      _Agency,
      _currency,
      _customer
      //_booking : redirected to composition child ZC_RD_book_BS
}
