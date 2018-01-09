class power5::add_sss_adis_grp{

file_line { 'adis_group_sss_id':
  path => '/etc/group',
  line => 'lifesci1:x:1399',
}

file_line { 'adis_users_sss_id':
  path => '/etc/group',
  line => 'lifesci_sternadi:1315:sternadi,eitanwin,talzinger,morgeva,guyling,maayana2,adinjermys,ariel,taliakustin,gallumbroso,maozgelbart,okushnir,leahfa,yaelyair1,galiofer,daniellem1',
}

}

##lifesci1:x:1399
#lifesci_sternadi:1315:sternadi,eitanwin,talzinger,morgeva,guyling,maayana2,adinjermys,ariel,taliakustin,gallumbroso,maozgelbart,okushnir,leahfa,yaelyair1,galiofer,daniellem1

