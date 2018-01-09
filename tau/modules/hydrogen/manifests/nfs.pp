class hydrogen::nfs{


#        if ($this_is_a_pbs_server) {
#                $mount_options='rw,rsize=8192,wsize=8192,soft,bg,nodev'
#        }
#        else {
#                $mount_options='ro,rsize=8192,wsize=8192,soft,bg,nodev'
#        }

             ## Powerapps folders

#make sure nfs client is installed: 
ensure_packages(['nfs-utils'],{'ensure'=>'present'})

        file { [ "/powerapps"  ]:
                ensure => 'directory',
        }->



        mount { '/powerapps':
                ensure  => 'mounted',
                device  => 'ccapps.tau.ac.il:/ccapps/powerapps',
                dump    => '0',
                fstype  => 'nfs',
                options => 'ro,rsize=8192,wsize=8192,soft,bg,nodev',
                #options => $mount_options,
                pass    => '0',
        }
	
	mount { '/export':
		ensure  => 'mounted',
                device  => 'hydrogen:/export',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,rsize=8192,wsize=8192,soft,bg,nodev',
                pass    => '0',
	}

}
