class nshomron::hosts {
	## Hosts file  
	file {'/etc/hosts':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0644',
		content => template('nshomron/hosts.tpl'),
         } # file /etc/hosts
}
