class rocks::smartd(
  $smartd_disks =           $rocks::params::smartd_disks,
) inherits rocks::params {

	package {'smartmontools':
		ensure => installed,
#		       provider => yum,
	}->


        file { '/etc/smartd.conf':
                ensure  => present,
                        owner  => 'root',
                        group  => 'root',
                        mode   => '0644',
                        source => 'puppet:///modules/rocks/smartd.conf',
        }~>

	service {'smartd':
		ensure => running,
		       enable => true,
		       subscribe => File['/etc/smartd.conf']		
	}->

	cron { 'smartdhealth':
		ensure  => 'present',
    		command => "/usr/sbin/smartctl -H /dev/$smartd_disks > /var/log/smartctl_health_check",
    		user => 'root',
    		hour => '0',
    		minute => '5',
	}
	
}
