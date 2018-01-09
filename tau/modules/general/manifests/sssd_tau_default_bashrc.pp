class general::sssd_tau_default_bashrc {

        file { '/etc/profile.d/a1_default_bashrc_add.sh':
         ensure  => present,
         owner  => 'root',
         group  => 'root',
         mode   => '0755',
         source => 'puppet:///modules/general/a1_default_bashrc_add.sh',
        }
	 
}

