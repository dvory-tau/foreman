class astro::infinibandupdate(
  $infiniband_pci_number = $astro::params::infiniband_pci_number,
  $infiniband_update_from = $astro::params::infiniband_update_from,
  $infiniband_update_psid = $astro::params::infiniband_update_psid,
  $infiniband_update_filename = $astro::params::infiniband_update_filename,
 ) inherits astro::params {

	# update ib fw 
	# infiniband_pci_number - The pci slot, where IB card is installed. lspci | grep Mel | awk '{print $1}'
        # infiniband_update_from - exact version from which you want to perform an update. flint -d 05:00.0 q | grep "FW Ver" | awk '{print $3}'
        # infiniband_update_psid - PSID of your current IB card. flint -d 05:00.0 q | grep "PSID" | awk '{print $2}'
        # infiniband_update_filename - firmware location. should be on nfs or other shared storage


    	exec { 'update_ib_fw':
		command => "/bin/flint -d ${infiniband_pci_number} -i ${infiniband_update_filename} burn",
		path    => ['/bin', '/usr/bin', '/usr/sbin'],
    		onlyif  => "/bin/flint -d ${infiniband_pci_number} q | grep ${infiniband_update_psid} 2>&1 > /dev/null && /bin/flint -d ${infiniband_pci_number} q | grep ${infiniband_update_from} 2>&1 > /dev/null",
		require => Exec[ 'install_mlnx_ofed' ],
    	}

	#notify { "/bin/flint -d ${infiniband_pci_number} q | grep ${infiniband_update_psid} 2>&1 > /dev/null && /bin/flint -d ${infiniband_pci_number} q | grep ${infiniband_update_from} 2>&1 > /dev/null": }

}
