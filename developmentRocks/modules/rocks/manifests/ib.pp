class rocks::ib(
  $rocks_ib_network =           $rocks::params::rocks_ib_network,
  $rocks_ib_mask =         	$rocks::params::rocks_ib_mask,
  $rocks_ib_netpattern =        $rocks::params::rocks_ib_netpattern,
  $rocks_ib_is_opensm_server =  $rocks::params::rocks_ib_is_opensm_server,
) inherits rocks::params { 

	include rocks::protection	

	## Get computer number
	$host_number =  regsubst($hostname,'^compute-(\d+)-(\d+)','\2')
	

	if (0 + $host_number > 0) {
		$ib0_address = regsubst($rocks_ib_netpattern, 'XXX', $host_number, 'G')

		exec { "remove ib0 symlink":
			command => "test -h /etc/sysconfig/network-scripts/ifcfg-ib0 && rm -f /etc/sysconfig/network-scripts/ifcfg-ib0",
			path    => ["/bin", "/usr/bin", "/usr/sbin"],
			onlyif  => "test -h /etc/sysconfig/network-scripts/ifcfg-ib0",
		}
		
		network::interface { 'ib0':
			hostname =>'$(hostname -s)',
			ipaddress => $ib0_address,
			enable_dhcp => false,
			startmode => onboot,
			onboot => yes,
			netmask => '192.168.0.0',
			broadcast => '192.168.255.255',
			usercontrol => 'no',
			type => 'Unknown',
			userctl => no,
			ipv6init => no,
			require => Exec[ "remove ib0 symlink" ],
		}
	
		include rocks::zabbixagent

		file { [ "/etc/zabbix/states/stat_ib0" ]:
			path => '/etc/zabbix/states/stat_ib0',
                	ensure => 'file',
                        mode => '0775',
                        owner => 'zabbix',
                        group => 'zabbix',
			require => File[ "/etc/zabbix/states" ]
	        }


		## starting services if they exists
		#file { '/etc/init.d/opensmd':
 		#	ensure => 'present',
  		#	audit  => 'all',
		#}
	
		#exec { "Check opensmd service":
                #        command => "service opensmd start",
                #        path    => ["/bin", "/sbin" , "/usr/bin", "/usr/sbin"],
                #        onlyif  => "test -x /etc/init.d/opensmd && ! service opensmd status",
                #}

                exec { "Check openibd service":
                        command => "service openibd start",
                        path    => ["/bin", "/sbin" , "/usr/bin", "/usr/sbin"],
                        onlyif  => "test -x /etc/init.d/openibd && ! service openibd status",
                }

		
		if ($rocks_ib_is_opensm_server) {
			#notify { "This node will be OpenSM server": }
			package { "opensm":
 				ensure => "installed"
			}

			##Opensm can be named opensmd (old kernel) opensm the new one.
	                exec { "Restart opensmd service":
        	                command => "service opensmd start",
                	        path    => ["/bin", "/sbin" , "/usr/bin", "/usr/sbin"],
               	 	        onlyif  => "test -x /etc/init.d/opensmd && ! service opensmd status",
               		}

                        exec { "Restart opensm service":
                                command => "service opensm start",
                                path    => ["/bin", "/sbin" , "/usr/bin", "/usr/sbin"],
                                onlyif  => "test -x /etc/init.d/opensm && ! service opensm status",
                        }
	
			

		}


	}

	#$rocks_ib_netpattern = '192.168.2.XXX'

}
