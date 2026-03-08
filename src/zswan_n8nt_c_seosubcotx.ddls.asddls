@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text table: Method parameters'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_SEOSUBCOTX as select from seosubcotx
{
    key clsname as ClassName,
    key cmpname as ComponentName,
    key sconame as Sconame,
    key langu as Language,
    descript as Text
}
