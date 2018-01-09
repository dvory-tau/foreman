class general::nfs_utils{

	if $operatingsystem == "CentOS" {
#                package { ['nfs-utils', 'nfs-utils-lib']:
		package { 'nfs-utils':
			ensure => installed,
			provider => yum,
		} 

		service {'nfs':
			ensure => running,
			enable => true,
#                        require => [ Package [ "nfs-utils" ], Package[ "nfs-utils-lib" ] ],
			require => Package [ "nfs-utils" ],
		}
	} else {
                package { 'nfs-common':
                        ensure => installed,
                } 

                service {'nfs':
                        ensure => running,
                        enable => true,
                        require => Package [ "nfs-common" ],
                }
	}      

}#class
