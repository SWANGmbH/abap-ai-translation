@ObjectModel: {
    query: {
        implementedBy: 'ABAP:ZSWAN_N8NT_CE_OBJECTS_QUERY'
    }
}
define root custom entity ZSWAN_N8NT_CE_PACKAGE_CONTENTS
{
  key Name        : sobj_name;
  key Type        : trobjtype;
      PackageName : devclass;
      MasterLanguage : spras;

}
