class rocks::protection (
  $rocks_headnode_req =           $rocks::params::rocks_headnode_req,
 ) inherits rocks::params {
	## Check if protection is disabled
#	if ($rocks_protection_status == 0) {
#		notify {"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!":}
#		notify { "Protection is disabled. Please remove /var/lib/puppet/state/.disable_protection for enabling.": }
#	} else {
#	        ## Check if $rocks_headnode 
        	if ($rocks_headnode == undef) or ($rocks_headnode != $rocks_headnode_req) {
                	fail("Puppet class misuse. Waiting cluster Cluster: \'$rocks_headnode_req\',  but \'$::rocks_headnode\' has been found")
        	}
	#} #else
}

