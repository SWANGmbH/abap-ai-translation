@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text table: Program'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_TRDIRT as select from trdirt
{
    key name as ProgramName,
    key sprsl as Language,
    text as Text
}
