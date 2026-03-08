@ObjectModel: {
    query: {
        implementedBy: 'ABAP:ZSWAN_N8NT_CE_METHOD_SRC_QUERY'
    }
}
define root custom entity ZSWAN_N8NT_CE_METHOD_SOURCE
{
  key ClassName  : seoclsname;
  key MethodName : seocpdname;
      SourceCode : abap.string( 10000 );
}
