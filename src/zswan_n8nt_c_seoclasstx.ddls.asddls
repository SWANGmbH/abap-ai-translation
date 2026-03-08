@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SEOCLASSTX'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSWAN_N8NT_C_SEOCLASSTX as select from seoclasstx
{
    key clsname as ClassName,
    key langu as Language,
    descript as Text
}
