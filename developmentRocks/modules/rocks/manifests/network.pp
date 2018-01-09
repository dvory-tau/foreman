class rocks::network( 
  $rocks_network_defaultgw = 	$rocks::params::rocks_network_defaultgw,
  $rocks_network = 		$rocks::params::rocks_network,
  $rocks_network_mask = 	$rocks::params::rocks_network_mask,
  $rocks_network_dns = 		$rocks::params::rocks_network_dns,
 ) inherits rocks::params {

        include rocks::protection


	## Set default GW
	if ($network_eth0 == $rocks_network) and ($netmask_eth0 == $rocks_network_mask) {
		network::interface { 'eth0':
			enable_dhcp => true,
			gateway => $rocks_network_defaultgw,
			dns1 => $rocks_network_dns,
		}
	} elsif ($network_eth1 == $rocks_network) and ($netmask_eth1 == $rocks_network_mask) {
		network::interface { 'eth1':
			enable_dhcp => true,
			gateway => $rocks_network_defaultgw,
			dns1 => $rocks_network_dns,
		}
	}

}

