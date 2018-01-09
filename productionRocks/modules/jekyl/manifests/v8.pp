class jekyl::v8 {

	package {'v8-3.14.5.10-25.el6.x86_64':
		ensure => installed,
		provider => yum,
		install_options => ['--enablerepo=base'],
		require => Class[ "epel::params" ],
	}
} 
