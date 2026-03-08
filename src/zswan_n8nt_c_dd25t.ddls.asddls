@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text table: View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_DD25T as select from dd25t
{
    key ddlanguage as Language,
    key viewname as Viewname,
    key as4local as As4local,
    key as4vers as As4vers,
    ddtext as Text
}
