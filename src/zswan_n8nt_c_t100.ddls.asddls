@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text table: Message class'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_T100 as select from t100
{
    key sprsl as Language,
    key arbgb as MessageClass,
    key msgnr as MessageNumber,
    text as Text
}
