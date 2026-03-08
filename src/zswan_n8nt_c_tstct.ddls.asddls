@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TSTCT'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_TSTCT as select from tstct
{
    key sprsl as Language,
    key tcode as TransactionCode,
    ttext as Text
}
