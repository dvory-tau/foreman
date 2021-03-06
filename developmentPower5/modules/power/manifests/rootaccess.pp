class power::rootaccess {

        include rocks::protection

	## Compute Node's  authorized_keys  
	file {'/root/.ssh/authorized_keys':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0600',
		source => 'puppet:///modules/power/ccadm_2keys'
        } # file /root/.ssh/authorized_keys

	user { 'root': 
  		ensure   => present,
  		password => '$1$znrEVC60$hxEj9YqREQXJOCom3gK0n0',
	}
}

