class general::nfs_utils_boost{

	if $operatingsystem == "CentOS" {
		package { 'nfs-utils':
			ensure => installed,
			provider => yum,
		} 


        exec {'enable_base_repo':
        path=>"/bin:/usr/bin:/usr/sbin/",
        command=>"sed -i '0,/enabled = 0/s//enabled = 1/' /etc/yum.repos.d/CentOS-Base.repo ",
        }




		if ($operatingsystemmajrelease == "7") {
			exec { 'rpc_enable':
				path => "/usr/bin",
				command => "systemctl enable rpcbind",
			} ->
                        service {'rpcbind':
                                ensure => running,
                                enable => true,
                        } ->
			service {'nfs':
				ensure => running,
				enable => true,
				require => Package [ "nfs-utils" ],
			}
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
