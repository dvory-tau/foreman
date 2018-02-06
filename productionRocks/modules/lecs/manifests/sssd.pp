class lecs::sssd()
{
	package {'authconfig-gtk':
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


	file {'/etc/sssd/sssd.conf':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0600',
		require => Package['sssd'],
		source => 'puppet:///modules/lecs/sssd.conf'
#		content=> template('general/sssd.conf.erb')
	} ~>

	service {'sssd':
		ensure => running,
		enable => true,
		require => [ File[ "/etc/sssd/sssd.conf" ], Package[ "sssd" ] ],
	} ->

	exec {'set-authconfig-enableldap':
		command => "authconfig --enablesssd --enablesssdauth --ldapserver='ldap.tau.ac.il' --ldapbasedn='o=tau' --enableldaptls --update;authconfig-gtk --nox  --enableldap --ldapserver='ldap.tau.ac.il' --ldapbasedn='o=tau' --enableldapauth --disableldapstarttls --update",
		path    => ["/usr/bin", "/usr/sbin","/bin"],
		# If already defined ldap - do not run the above. '-q' is for 'quiet' grep
		unless => "grep -q 'USELDAP=yes' /etc/sysconfig/authconfig",
	}
#		exec {'set-authconfig-enableldap':
#			command => "grep -q 'USELDAP=yes' /etc/sysconfig/authconfig|| authconfig --enableldap --update",
#			path    => ["/usr/bin", "/usr/sbin","/bin"],
#			unless => "grep -q 'USELDAP=yes' /etc/sysconfig/authconfig",
#		}

#		exec {'set-authconfig-enableldapauth':
#			command => "grep -q 'USELDAPAUTH=yes' /etc/sysconfig/authconfig|| authconfig --enableldapauth --update",
#			path    => ["/usr/bin", "/usr/sbin","/bin"],
#			unless => "grep -q 'USELDAPAUTH=yes' /etc/sysconfig/authconfig",
#		}

}#class
