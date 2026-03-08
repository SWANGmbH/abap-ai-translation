@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text table: Function module'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_TFTIT as select from tftit
{
    key spras as Language,
    key funcname as FunctionModule,
    stext as Text
}
