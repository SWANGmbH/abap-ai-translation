@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text table: Table type'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_DD40T as select from dd40t
{
    key typename as Typename,
    key ddlanguage as Language,
    key as4local as As4local,
    ddtext as Text
}
