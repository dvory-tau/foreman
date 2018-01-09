class rocks::puppet (
  $rocks_puppet_env =           $rocks::params::rocks_puppet_env,
 ) inherits rocks::params {

        include rocks::protection

	service {'puppet':
		ensure => running,
		enable => true,
	} 
}

