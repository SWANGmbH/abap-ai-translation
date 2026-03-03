@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text table: Package (DEVC)'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_TDEVCT as select from tdevct
{
    key devclass as PackageName,
    key spras as Language,
    ctext as Text
}
