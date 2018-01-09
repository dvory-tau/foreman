class astro::nfs {

        file { [ '/storage', '/storage/home',  '/storage/old_gastro', '/storage/fast', '/usr/local.cc', '/newstorage', '/share' ]:
                ensure => 'directory',
                require => [File[ '/etc/hosts' ], Package['nfs-utils'] ]
        }
/*
        mount { '/storage/hn-export': #'/export':
                ensure  => 'mounted',
                device  => '192.168.200.253:/storage/hn-export',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,rsize=8192,wsize=8192,soft,bg,nodev,tcp',
                pass    => '0',
		require => [ File[ '/storage/hn-export' '/export' ], Package['nfs-utils'] ]
        }

*/
/*
	mount { '/storage/hn-export':
                ensure  => 'mounted',
                device  => 'astro-headnode-def.local:/export',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,rsize=8192,wsize=8192,soft,bg,nodev,tcp',
                pass    => '0',
               require => [ File[ '/storage/hn-export' ],  ]
        }
*/

 


        mount { '/share':
                ensure  => 'mounted',
               device  => 'hp-storage-file1.local:/storage/share',
                dump    => '0',
                fstype  => 'nfs',
                options => 'nfsvers=3,rw,rsize=8192,wsize=8192,soft,bg,nodev,tcp',
                pass    => '0',
                require => [ File[ '/share' ], ]
        }


        mount { '/storage/home':
                ensure  => 'mounted',
                #device  => '192.168.200.253:/storage/home',
                device  => 'hp-storage-file1.local:/storage/home',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,nfsvers=3,rsize=8192,wsize=8192,soft,bg,nodev,tcp',
                pass    => '0',
                require => [ File[ '/storage/home' ],]
        }

        mount { '/storage/fast':
                ensure  => 'mounted',
                device  => 'hp-storage-file1.local:/storage_fast',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,nfsvers=3,rsize=8192,wsize=8192,soft,bg,nodev,tcp',
                pass    => '0',
                require => [ File[ '/storage/fast' ], ]
        }


        mount { '/storage/old_gastro':
                ensure  => 'mounted',
                #device  => '192.168.200.253:/storage/home',
                device  => 'hp-storage-file1.local:/storage/old_gastro',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,nfsvers=3,rsize=8192,wsize=8192,soft,bg,nodev,tcp',
                pass    => '0',
                require => [ File[ '/storage/old_gastro' ], Package['nfs-utils'], ]
        }

	# preferred symlink syntax
	file { '/mnt/gastro':
	    	ensure => 'link',
    		target => '/storage/old_gastro',
		force => true,
  	}

        # preferred symlink syntax
        file { '/export':
                ensure => 'link',
                target => '/share',
		require => Mount['/share'],
                force => true,
        }
  
	#mount { '/export':
	#	ensure => 'absent',
	#	#force => true,
	#}




        mount { '/usr/local.cc':
                ensure  => 'mounted',
                device  => 'ccapps.tau.ac.il:/ccapps/usr/local.linux',
                dump    => '0',
                fstype  => 'nfs',
                options => 'exec,dev,suid,hard,intr,rw,bg,acl',
                pass    => '0',
                require => [ File[ '/usr/local.cc' ], ]
        }

        #mount { '/mnt/gastro':
        #        ensure  => 'mounted',
        #        device  => '192.168.200.8:/astrostorage',
        #        dump    => '0',
        #        fstype  => 'glusterfs',
        #        options => 'defaults',
        #        pass    => '0',
	#	remounts => false,
        #        require => [ File[ '/mnt/gastro' ], Package['glusterfs-fuse'] ]
        #}

	mount { '/newstorage':
                ensure  => 'absent',
                device  => '192.168.200.8:/newstorage',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,nfsvers=3,rsize=8192,wsize=8192,soft,bg,nodev,tcp',
                pass    => '0',
                require => [ File[ '/newstorage' ], Package['nfs-utils'] ]
        }


}
