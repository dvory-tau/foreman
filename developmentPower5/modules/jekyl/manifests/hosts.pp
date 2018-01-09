class jekyl::hosts {
	## Hosts file  
	file {'/etc/hosts':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0644',
		content => template('jekyl/hosts.tpl'),
         } # file /etc/hosts
}
