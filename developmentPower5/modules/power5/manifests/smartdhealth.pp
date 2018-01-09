class power5::smartdhealth {


	
		package {'smartmontools':
                ensure => installed,
        }->


        file { '/etc/smartd.conf':
                ensure  => present,
                        owner  => 'root',
                        group  => 'root',
                        mode   => '0644',
                        source => 'puppet:///modules/power5/smartd.conf',
        }~>

        service {'smartd':
                ensure => running,
                       enable => true,
                       subscribe => File['/etc/smartd.conf']
        }->

	cron { 'smartdhealth':
	    ensure  => 'present',
	    command => '/usr/sbin/smartctl -H /dev/sda > /var/log/smartctl_health_check',
	    user => 'root',
	    hour => '0',
	    minute => '0',
	}

      #}


	
}
