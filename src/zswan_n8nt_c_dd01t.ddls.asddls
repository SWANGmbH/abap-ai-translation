@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text table: Domain'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_DD01T as select from dd01t
{
    key domname as DomainName,
    key ddlanguage as Language,
    key as4local as As4local,
    key as4vers as As4vers,
    ddtext as Text
}
