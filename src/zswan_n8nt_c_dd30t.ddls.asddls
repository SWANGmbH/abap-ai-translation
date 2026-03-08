@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text table: Search help'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_DD30T as select from dd30t
{
    key shlpname as SearchHelpName,
    key ddlanguage as Language,
    key as4local as As4local,
    ddtext as Text
}
