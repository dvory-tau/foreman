class power5::add_usr_local_path {

        file { '/etc/profile.d/add_usr_local_path.sh':
         ensure  => present,
         owner  => 'root',
         group  => 'root',
         mode   => '0755',
         source => 'puppet:///modules/power5/add_usr_local_path.sh',
        }
	 
       file { '/etc/profile.d/add_usr_local_path.csh':
         ensure  => present,
         owner  => 'root',
         group  => 'root',
         mode   => '0755',
         source => 'puppet:///modules/power5/add_usr_local_path.csh',
        }
}
