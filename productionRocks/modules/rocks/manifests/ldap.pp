class rocks::ldap {
        include rocks::protection


	## Instal sssd package
	package {'sssd-common':
		ensure => installed,
		provider => yum,
		install_options => ['--enablerepo=base'],
	}

	package {'sssd-client':
		ensure => installed,
		provider => yum,
		install_options => ['--enablerepo=base'],
	}

	package {'sssd':
		ensure => installed,
		provider => yum,
		install_options => ['--enablerepo=base'],
	}

	## Configure and check sssd services
	service {'sssd':
		ensure => running,
		enable => true,
		require => [ File[ "/etc/sssd/sssd.conf" ], Package[ "sssd" ] ],
	}      


	## Configuration files  
	file {'/etc/nsswitch.conf':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0644',
		require => Package['sssd'],
		source => 'puppet:///modules/rocks/nsswitch.conf'
         } # file /etc/nsswitch.conf

	file {'/etc/sssd/sssd.conf':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0600',
		require => Package['sssd'],
		source => 'puppet:///modules/rocks/sssd.conf'
         } # file /etc/sssd/sssd.conf

	file {'/etc/pam.d/password-auth-ac':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0644',
		require => Package['sssd'],
		source => 'puppet:///modules/rocks/password-auth-ac'
         } # file /etc/pam.d/password-auth-ac

	file {'/etc/pam.d/fingerprint-auth-ac':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0644',
		require => Package['sssd'],
		source => 'puppet:///modules/rocks/fingerprint-auth-ac'
         } # file /etc/pam.d/fingerprint-auth-ac

	file {'/etc/pam.d/smartcard-auth-ac':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0644',
		require => Package['sssd'],
		source => 'puppet:///modules/rocks/smartcard-auth-ac'
         } # file /etc/pam.d/password-auth-ac

} # class rocksldap
