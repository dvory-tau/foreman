class rocks::rootaccess (
  $rocks_file_authorized_keys 	= $rocks::params::rocks_file_authorized_keys,
  $rocks_root_pwd 		= $rocks::params::rocks_root_pwd,
 ) inherits rocks::params {
        include rocks::protection

	## Compute Node's  authorized_keys  
	if ($rocks_file_authorized_keys) {
		file {'/root/.ssh/authorized_keys':
			ensure => present,
			owner  => 'root',
			group  => 'root',
			mode   => '0600',
			source => $rocks_file_authorized_keys
        	} # file /root/.ssh/authorized_keys
	} # if rocks_file_authorized_keys

#	if ($rocks_root_pwd) {
#		user { 'root': 
#  			ensure   => present,
#	  		password => $rocks_root_pwd,
#		}
#	} # if
}
