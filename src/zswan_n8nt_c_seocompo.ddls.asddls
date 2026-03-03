@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Class components like methds'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_SEOCOMPO as select from seocompo
{
    key clsname as ClassName,
    key cmpname as ComponentName,
    cmptype as ComponentType,
    mtdtype as MethodCategory
}
