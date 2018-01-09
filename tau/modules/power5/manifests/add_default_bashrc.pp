class power5::add_default_bashrc {

        file { '/etc/profile.d/a1_default_bashrc_add.sh':
         ensure  => present,
         owner  => 'root',
         group  => 'root',
         mode   => '0755',
         source => 'puppet:///modules/power5/a1_default_bashrc_add.sh',
        }
	 
}
