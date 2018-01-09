class rocks::smartd(
  $smartd_options =           $rocks::params::smartd_options,
) inherits rocks::params {
	# Zabbix checking by vfs.file.regmatch[/var/log/smartctl_health_check,"(SMART Health Status: OK)|PASSED"]
	#
	#

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
    		command => "/usr/sbin/smartctl $smartd_options > /var/log/smartctl_health_check",
    		user => 'root',
    		hour => '0',
    		minute => '5',
	}
	
}
