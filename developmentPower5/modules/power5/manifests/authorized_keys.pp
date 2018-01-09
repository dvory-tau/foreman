class power5::authorized_keys {
	
	file{'/root/.ssh': ensure=>directory,}

        file { '/root/.ssh/authorized_keys':
         ensure  => present,
         owner  => 'root',
         group  => 'root',
         mode   => '0755',
         source => 'puppet:///modules/power5/authorized_keys',
        }
}
