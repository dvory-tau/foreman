class power::hosts {
	#notify { "Hello BIG World": }

	#adding self-hosts
	#host { $hostname:
 	#   ip => $ipaddress,
	#}


	## Hosts file  
	file {'/etc/hosts':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0644',
		content => template('power/hosts.tpl'),
         } # file /etc/hosts
}
