class astro::infiniband(
  $infiniband_host_number = $astro::params::infiniband_host_number,
 ) inherits astro::params {


	# install IB packages
	## required packages
	## Kernel packages
        file { '/etc/yum.repos.d/VCentos.repo':
                ensure  => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0755',
                source => "puppet:///modules/astro/VCentos.repo",
        }

	# Install restricted package
	exec { 'kernel_packages':
               path    => ["/bin", "/usr/bin", "/usr/sbin"],
	       command => "yum --disablerepo=VC7.2.1511-base --disableexcludes=all -y install kernel-devel-${kernelrelease}  kernel-headers-${kernelrelease}",
	       require => File[ '/etc/yum.repos.d/VCentos.repo' ],
               unless  => "rpm -q kernel-devel && rpm -q kernel-headers",
        }

	$ibpackages = [ 'gcc-gfortran', 'tk', 'perl', 'libnl', 'lsof', 'gtk2', 'atk', 'cairo', 'libxml2-python', 'tcsh' , 'createrepo', 'redhat-rpm-config', 'rpm-build', 'python-devel']


	package { $ibpackages: }

	$osver="rhel${lsbmajdistrelease}.${lsbminordistrelease}"
#	$driverpath = "/storage/hn-export/distrib/mlnx/MLNX_OFED_LINUX-$osver/mlnxofedinstall"
	$driverpath = "/share/distrib/mlnx/MLNX_OFED_LINUX-$osver/mlnxofedinstall"


	# install mlnx ofed software
    	exec { 'install_mlnx_ofed':
		command => "${$driverpath} --force --without-fw-update --add-kernel-support; test -f /etc/infiniband/info || touch /tmp/infiniband_failed;",
		path    => ['/bin', '/usr/bin', '/usr/sbin'],
    		onlyif  => 'test ! -f /etc/infiniband/info',
		timeout => 1800,
		require => [ Package[$ibpackages], Mount[ '/share' ] ]
#		require => [ Package[$ibpackages], Mount[ '/storage/hn-export/' ] ]
    	}


	exec { 'set_ib_params_2_ib_ports':
                command => '/usr/sbin/connectx_port_config -c ib,ib',
		unless => 'ip link show | grep ib1',
                require => Exec['install_mlnx_ofed'],
		subscribe => Exec[ 'install_mlnx_ofed' ],
		path    => ['/bin', '/usr/bin', '/usr/sbin'],
        }

	service { 'openibd':
	    	ensure  => 'running',
	    	enable  => true,
		subscribe => Exec[ 'install_mlnx_ofed' ],
		require => Exec[ 'install_mlnx_ofed' ],
	}

	
	reboot { 'reboot_after_install':
 		subscribe       => Exec[ 'set_ib_params_2_ib_ports' ],
		message		=> 'Reboot after successfull installation of Infiniband',
	}

	

 	exec {'Something go wrong with IB installation. /tmp/infiniband_failed found. Please solve the problem, and delete this file.':
	    command         => "/bin/true",
	    user            => root,
	    onlyif          => "test -f /tmp/infiniband_failed",
	    path            => ['/usr/bin','/usr/sbin','/bin','/sbin'],
	}


	## Get computer number
	#$host_number =  regsubst($hostname,'^compute-(\d+)-(\d+)','\2')
	

	if (0 + $infiniband_host_number > 0) {
		$ib0_address = regsubst("10.0.0.XXX", 'XXX', $infiniband_host_number, 'G')

		network::interface { 'ib0':
			hostname =>'$(hostname -s)',
			ipaddress => $ib0_address,
			enable_dhcp => false,
			startmode => onboot,
			onboot => yes,
			netmask => '255.255.255.0',
			broadcast => '10.0.0.255',
			usercontrol => 'no',
			type => 'Infiniband',
			userctl => no,
			ipv6init => no,
			#ZONE => 'trusted',
			#require => Service[ "openibd" ],
		}

		#network::route { 'ib0':
		#	ipaddress => [ '192.168.200.7', '192.168.200.8', ],
  		#	netmask   => [ '255.255.255.255', '255.255.255.255',],
  		#	gateway   => [ '10.0.0.7', '10.0.0.8',],
		#}


	}


}
