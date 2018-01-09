class power::services{
	## Run services for power cluster
	#notify { "Power services": }

	service { 'sssd' :
		ensure => "running",
		enable => true,
	} 

	## PBS Start script return 0 for status even for pbs is not running
	## Workaround
        exec { "Restart PBS service":
		command => "service pbs restart",
		path    => ["/bin", "/sbin" , "/usr/bin", "/usr/sbin"],
		onlyif  => "service pbs status  | grep 'is not running'",
	}

}
