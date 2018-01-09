class gamma::omnipath_gamma(
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
                command => "yum install -y libhfi1.x86_64 libibmad libibverbs librdmacm libibcm qperf perftest rdma infinipath-psm expat elfutils-libelf-devel libstdc++-devel gcc-gfortran atlas tcl expect tcsh sysfsutils pciutils opensm-devel opensm-libs libibverbs-devel libibmad-devel librdmacm-devel ibacm-devel openssl-devel libuuid-devel  expat-devel infinipath-psm-devel papi opensm redhat-rpm-config ibacm rpm-build ",
                path    => ["/bin", "/usr/bin", "/usr/sbin"],
                onlyif  => "test ! -f /usr/sbin/opaconfig && test ! -f /tmp/omnipath_failed",
        }

	$osver="RHEL${lsbmajdistrelease}${lsbminordistrelease}"
	$driverpath = "/powerapps/share/distrib/ompipath/IntelOPA-Basic.$osver.tgz"
	$dirverlocalfolder = "/tmp/IntelOPA-Basic.$osver"


	exec { 'op_pre_untar':
		command => "tar xf ${driverpath} -C /tmp",
		path    => ["/bin", "/usr/bin", "/usr/sbin"],
		require => [ Exec[ 'op_pre_yum' ],/* Mount[ '/powerapps' ],*/ ], 
		onlyif  => "test ! -f /usr/sbin/opaconfig && test ! -f /tmp/omnipath_failed",
	}

	exec { 'op_install':
#               command => "${dirverlocalfolder}/INSTALL -n; test -f /usr/sbin/opaconfig || touch /tmp/omnipath_failed",
                command => "cd ${dirverlocalfolder} && ${dirverlocalfolder}/INSTALL -a",
                cwd     => "${dirverlocalfolder}",
                path    => ["/bin", "/usr/bin", "/usr/sbin"],
                require => Exec[ 'op_pre_untar' ],
                onlyif  => "test ! -f /usr/sbin/opaconfig && test ! -f /tmp/omnipath_failed",
        }
        $host_number = regsubst($ipaddress_eno1,'^(\d+).(\d+).(\d+).(\d+)','\4')

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
	
        } 

package {'opa-fm':
	ensure => 'installed',
}
if ($ib_is_opensm_server)
{

	service {'opafm':
	enable=>'true',
	ensure=>'running',}
}
else {
	service {'opafm':
	enable=>'false',
	ensure=>'stopped',}

}

}
