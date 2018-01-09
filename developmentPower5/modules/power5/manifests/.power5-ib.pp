define check_ib_host {
       notify { "Found user $name": }
}


class power5::power5-ib(
  $rocks_ib_network =           $power5::power5ibparams::rocks_ib_network,
  $rocks_ib_mask =         	$power5::power5ibparams::rocks_ib_mask,
  $rocks_ib_netpattern =              $power5::power5ibparams::rocks_ib_netpattern,
  $rocks_ib_is_opensm_server =   $power5::power5ibparams::rocks_ib_is_opensm_server,
  $rocks_ib_enabled = $power5::power5ibparams::rocks_ib_enabled,
 ) inherits power5::power5ibparams { 

	# install IB packages
	## required packages
	package {'gcc-gfortran':
		ensure => installed,
		provider => yum,
    	}

 	package {'tk':
		ensure => installed,
		provider => yum,
    	}

	# download IB software
    	exec { "download_ib_ofed":
		command => "wget http://www.mellanox.com/downloads/ofed/MLNX_OFED-3.3-1.0.4.0/MLNX_OFED_LINUX-3.3-1.0.4.0-rhel6.8-x86_64.iso -O /tmp/MLNX_OFED_LINUX-3.3-1.0.4.0-rhel6.8-x86_64.iso",
		path    => ["/bin", "/usr/bin", "/usr/sbin"],
    		onlyif  => "test ! -f /tmp/MLNX_OFED_LINUX-3.3-1.0.4.0-rhel6.8-x86_64.iso && test ! -f /etc/infiniband/info",
		require => package ["tk","gcc-gfortran"]
    	}


	# work only with centos > 6.8 and kernel revision > 500
	if $operatingsystem == "CentOS" {
		$kernel_revision = regsubst($kernelrelease,'^\d+\.\d+\.\d+-(\d+).*$','\1')
		#notify { "Kernel revision ${kernel_revision}": }
		if ($operatingsystemmajrelease == 6 and $kernel_revision > 500)  {
		#$lsbminordistrelease >= 8
			# install IB software (try only once, if failed create file-flag /tmp/infiniband_failed, that prevent feature installation running)
		    	exec { "install_ib_ofed":
        			command => "mount -o ro,loop /tmp/MLNX_OFED_LINUX-3.3-1.0.4.0-rhel6.8-x86_64.iso /mnt; /mnt/mlnxofedinstall --force --without-fw-update;umount -fl /mnt; test -f /etc/infiniband/info || touch /tmp/infiniband_failed; rm /tmp/MLNX_OFED_LINUX-3.3-1.0.4.0-rhel6.8-x86_64.iso",
		        	path    => ["/opt/pbs/default/bin","/opt/pbs/default/sbin","/usr/local/sbin","/usr/local/bin","/sbin","/bin","/usr/sbin","/usr/bin","/usr/local.cc/bin","/opt/ibutils/bin","/powerapps/share/bin","/root/bin"],
			        onlyif  => "test ! -f /etc/infiniband/info && test ! -f /tmp/infiniband_failed", #run only if none of these files exists
				require => exec [ "download_ib_ofed" ],
				timeout     => 1800, 
				logoutput => true, #output install log
			#	notify => Service ['openibd'], # restart openibd
		    	}
		} else {
			notify { "OFED is unsupported with this kernel": }

			exec { "install_ib_ofed":
                                command => "/bin/true",
                                path    => ["/sbin","/bin","/usr/sbin","/usr/bin"],

			}
		}
	} #if $operatingsystem == "CentOS" 
		

	#if ! defined(Service['openibd']) {
	# 	service { 'openibd':
#		    ensure  => 'running',
#		    enable  => true,
#		}
#	    }

	# Notify user (puppet agent output) about problem with installation
 	exec {'Something go wrong with IB installation. /tmp/infiniband_failed found. Please solve the problem, and delete this file.':
	    command         => "/bin/true",
	    user            => root,
	    onlyif          => "test -f /tmp/infiniband_failed",
	    path            => ['/usr/bin','/usr/sbin','/bin','/sbin'],
	  }

        # configure IB if needed
        if ($rocks_ib_enabled) {

          ## Get computer number
          $host_number = regsubst($hostname,'^compute-(\d+)-(\d+)','\2')

          if ($host_number > 0) {
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
                        ipv6init => no,
                        subscribe => Exec ['install_ib_ofed'],
                        #require => Exec[ "remove ib0 symlink" ],
                }

                #file { [ "/etc/zabbix/states" ]:
                #        ensure => 'directory',
                #        mode => '0775',
                #        owner => 'zabbix',
                #        group => 'zabbix',
                #        require => Class[ "zabbix::agent" ],
                #}


                file { [ "/etc/zabbix/states/stat_ib0" ]:
                        path => '/etc/zabbix/states/stat_ib0',
                        ensure => 'file',
                        mode => '0775',
                        owner => 'zabbix',
                        group => 'zabbix',
                        require => File[ "/etc/zabbix/states" ]
                }


                ## starting services if they exists
                #exec { "Check openibd service":
                #        command => "service openibd start",
                #        path    => ["/bin", "/sbin" , "/usr/bin", "/usr/sbin"],
                #        onlyif  => "test -x /etc/init.d/openibd && ! service openibd status",
                #}
                service { 'openibd':
                    ensure  => 'running',
                    enable  => true,
                    subscribe => Exec ["install_ib_ofed"],
                }



                if ($rocks_ib_is_opensm_server) {
                        #notify { "This node will be OpenSM server": }
                        package { "opensm":
                                ensure => "installed"
                        }

                        exec { "Restart opensm service":
                                command => "service opensm start",
                                path    => ["/bin", "/sbin" , "/usr/bin", "/usr/sbin"],
                                onlyif  => "test -x /etc/init.d/opensm && ! service opensm status",
                        }



                }


          }
        } # if rocks_ib_enabled

}
