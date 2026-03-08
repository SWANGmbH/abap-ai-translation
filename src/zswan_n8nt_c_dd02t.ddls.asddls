@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text tabel: Table / Structure'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_DD02T as select from dd02t
{
    key tabname as Tabname,
    key ddlanguage as Language,
    key as4local as As4local,
    key as4vers as As4vers,
    ddtext as Text
}
