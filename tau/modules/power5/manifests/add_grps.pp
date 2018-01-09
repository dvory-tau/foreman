class power5::add_grps{

file_line { 'medicine_grp_id':
  path => '/etc/group',
  line => 'medicine1:x:1499',
}

}

