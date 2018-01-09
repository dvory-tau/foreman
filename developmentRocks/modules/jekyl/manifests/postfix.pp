class jekyl::postfix {

	## Configuration files  
	file {'/etc/postfix/main.cf':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0644',
		source => 'puppet:///modules/jekyl/main.cf'
         } # file /etc/postfix/main.cf

} # class rocksldap
