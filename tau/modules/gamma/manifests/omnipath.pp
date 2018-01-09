class gamma::omnipath(
$ib_network = '10.0.0.0',
$ib_mask = '255.255.255.0',
$ib_netpattern = '10.0.0.XXX',
$ib_broadcast = '10.0.0.255',
$ib_is_opensm_server = false,
 ) { 

	# install IB packages
	## required packages
        file { '/etc/yum.repos.d/VCentos.repo':
                ensure  => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0755',
                source => "puppet:///modules/ib_net_omni/VCentos.repo",
		before => Exec['op_pre_yum'],
        }

	# Install restricted package
	exec { 'op_kernel_packages':
               path    => ["/bin", "/usr/bin", "/usr/sbin"],
	       command => "yum --enablerepo=VC* --disableexcludes=all -y install kernel-devel-${kernelrelease}  kernel-headers-${kernelrelease}",
	       require => File[ '/etc/yum.repos.d/VCentos.repo' ],
	       before  => Exec['op_pre_yum'],
               unless  => "rpm -q kernel-devel && rpm -q kernel-headers",
        }

	exec { 'op_pre_yum':
                command => "yum install -y libhfi1.x86_64 libibmad libibverbs librdmacm libibcm qperf perftest rdma infinipath-psm expat elfutils-libelf-devel libstdc++-devel gcc-gfortran atlas tcl expect tcsh sysfsutils pciutils opensm-devel opensm-libs libibverbs-devel libibmad-devel librdmacm-devel ibacm-devel openssl-devel libuuid-devel  expat-devel infinipath-psm-devel papi opensm redhat-rpm-config  rpm-build ibacm",
                path    => ["/bin", "/usr/bin", "/usr/sbin"],
                onlyif  => "test ! -f /usr/sbin/opaconfig && test ! -f /tmp/omnipath_failed",
        }

	$osver="RHEL${lsbmajdistrelease}${lsbminordistrelease}"
	$driverpath = "/powerapps/share/distrib/ompipath/IntelOPA-Basic.$osver.tgz"
	$dirverlocalfolder = "/tmp/IntelOPA-Basic.$osver"


	exec { 'op_pre_untar':
		command => "tar xf ${driverpath} -C /tmp",
		path    => ["/bin", "/usr/bin", "/usr/sbin"],
		require => [ Exec[ 'op_pre_yum' ], Mount[ '/powerapps' ], ], 
		onlyif  => "test ! -f /usr/sbin/opaconfig && test ! -f /tmp/omnipath_failed",
	}

	exec { 'op_install':
#		command => "${dirverlocalfolder}/INSTALL -n; test -f /usr/sbin/opaconfig || touch /tmp/omnipath_failed",
		command => "cd ${dirverlocalfolder} && ./INSTALL -a",
		cwd	=> "${dirverlocalfolder}",
		path    => ["/bin", "/usr/bin", "/usr/sbin"],
                require => Exec[ 'op_pre_untar' ],
		onlyif  => "test ! -f /usr/sbin/opaconfig && test ! -f /tmp/omnipath_failed",
        }

#	exec { 'op_post_rm':
#		command => "rm -fr ${dirverlocalfolder}",
#                path    => ["/bin", "/usr/bin", "/usr/sbin"],
#		onlyif  => "test -d ${dirverlocalfolder}",
#                require => Exec[ 'op_install' ],
#	}
#
#	# Notify user (puppet agent output) about problem with installation
# 	exec {'Something go wrong with Omni Path installation. /tmp/omnipath_failed found. Please solve the problem, and delete this file.':
#	    command         => "/bin/true",
#	    user            => root,
#	    onlyif          => "test -f /tmp/omnipath_failed",
#	    path            => ['/usr/bin','/usr/sbin','/bin','/sbin'],
#	}
#
#	reboot { 'reboot_after_install':
# 		subscribe       => Exec[ 'op_install' ],
#		message		=> 'Reboot after successfull installation of omnipath',
#	}


        # Get computer number
        $host_number = regsubst($hostname,'^compute-(\d+)-(\d+)','\2')
	
        if ($host_number > 0) {
        	$ib0_address = regsubst('10.0.0.XXX', 'XXX', $host_number, 'G')
	
                network::interface { 'ib0':
                        hostname =>'$(hostname -s)',
			type => "Infiniband",
                        ipaddress => $ib0_address,
                        enable_dhcp => false,
                        startmode => onboot,
                        onboot => yes,
                        netmask => $ib_mask,
                        broadcast => $ib_broadcast,
                        ipv6init => no,
			require => Exec[ 'op_install' ],
                }
	
        } # if host_number
package {'opa-fm':
        ensure => 'installed',
}

/*
if ($host_number == 1) {
		$opensm_server = true}
else {$opensm_server = false}

package {'opa-fm':
	ensure => 'installed',
}
if ($opensm_server)
{

	service {'opafm':
	enable=>'true',
	ensure=>'running',}
}
else {
	service {'opafm':
	enable=>'false',
	ensure=>'stopped',}

}#else
*/

service {'opafm':
        enable=>'true',
        ensure=>'running',}

}
