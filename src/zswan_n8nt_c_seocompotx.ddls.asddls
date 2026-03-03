@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text table: Class methods (SEOCOMPOTX)'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_SEOCOMPOTX as select from seocompotx
{
    key clsname as ClassName,
    key cmpname as ComponentName,
    key langu as Language,
    descript as Text
}
