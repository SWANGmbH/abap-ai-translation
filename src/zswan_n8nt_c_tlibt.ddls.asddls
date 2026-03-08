@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text table: Function Group'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_TLIBT as select from tlibt
{
    key spras as Language,
    key area as FunctionGroup,
    areat as Text
}
