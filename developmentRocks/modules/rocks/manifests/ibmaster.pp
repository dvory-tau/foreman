class rocks::ibmaster(
  $rocks_ib_network =           $rocks::rocksparams::rocks_ib_network,
  $rocks_ib_mask =         	$rocks::rocksparams::rocks_ib_mask,
  $rocks_ib_netpattern =        $rocks::rocksparams::rocks_ib_netpattern,
  $rocks_ib_is_opensm_server =  $rocks::rocksparams::rocks_ib_is_opensm_server,
) inherits rocks::rocksparams { 
	## Get computer number
	$host_number = regsubst($hostname,'^compute-(\d+)-(\d+)','\2')

	if ($host_number > 0) {
		$ib0_address = regsubst($rocks_ib_netpattern, 'XXX', $host_number, 'G')

		
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


}
