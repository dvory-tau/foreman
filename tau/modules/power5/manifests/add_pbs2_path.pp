class power5::add_pbs2_path {

        file { '/etc/profile.d/add_pbs2_path.sh':
         ensure  => present,
         owner  => 'root',
         group  => 'root',
         mode   => '0755',
         source => 'puppet:///modules/power5/add_pbs2_path.sh',
        }
	 
       file { '/etc/profile.d/add_pbs2_path.csh':
         ensure  => present,
         owner  => 'root',
         group  => 'root',
         mode   => '0755',
         source => 'puppet:///modules/power5/add_pbs2_path.csh',
        }
}
