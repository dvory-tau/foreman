class power5::nfs {

        #include rocks::protection

	## Scratch directories
        #file { [ "/scratch100" , "/scratch200" , "/scratch300" ,"/usr/local.cc"]:
	file { [ "/scratch100" , "/scratch200" , "/scratch300"]:
                ensure => 'directory',
        }

        #mount { '/usr/local.cc':
        #        ensure  => 'mounted',
        #        device  => 'ccapps.tau.ac.il:/ccapps/usr/local.linux',
        #        dump    => '0',
        #        fstype  => 'nfs',
        #        options => 'ro,rsize=8192,wsize=8192,hard,intr,bg,lock,tcp,nodev,nfsvers=3',
        #        pass    => '0',
#		require => File[ "/usr/local.cc" ],
        #}

        mount { '/scratch100':
                ensure  => 'mounted',
                device  => 'scratchfs.tau.ac.il:/power1/data',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nosuid,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/scratch100" ],
        }

        mount { '/scratch200':
                ensure  => 'mounted',
                device  => 'scratch200fs.tau.ac.il:/power2/data',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nosuid,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/scratch200" ],
        }

        mount { '/scratch300':
                ensure  => 'mounted',
                device  => 'scratch300fs.tau.ac.il:/power3/data',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nosuid,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/scratch300" ],
        }



	## Power Sternadi lab
        file { [ "/sternadi" , "/sternadi/home" , "/sternadi/home/volume1" , "/sternadi/home/volume2" , "/sternadi/home/volume3" , "/sternadi/datasets" , "/sternadi/datasets/volume1" , "/sternadi/datasets/volume2" , "/sternadi/nobackup" , "/sternadi/nobackup/volume1" ]:
                ensure => 'directory',
        }

        mount { '/sternadi/home/volume1':
                ensure  => 'mounted',
                device  => 'powersternadilabtmpfs.tau.ac.il:/sternadi/home/volume1',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/sternadi" , "/sternadi/home" , "/sternadi/home/volume1" ],
        }

        mount { '/sternadi/home/volume2':
                ensure  => 'mounted',
                device  => 'powersternadilabtmpfs.tau.ac.il:/sternadi/home/volume2',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/sternadi" , "/sternadi/home" , "/sternadi/home/volume2" ],
        }

        mount { '/sternadi/home/volume3':
                ensure  => 'mounted',
                device  => 'powersternadilabtmpfs.tau.ac.il:/sternadi/home/volume3',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/sternadi" , "/sternadi/home" , "/sternadi/home/volume3" ],
        }

        mount { '/sternadi/datasets/volume1':
                ensure  => 'mounted',
                device  => 'powersternadilabtmpfs.tau.ac.il:/sternadi/datasets/volume1',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/sternadi" , "/sternadi/datasets" , "/sternadi/datasets/volume1" ],
        }

        mount { '/sternadi/datasets/volume2':
                ensure  => 'mounted',
                device  => 'powersternadilabtmpfs.tau.ac.il:/sternadi/datasets/volume2',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/sternadi" , "/sternadi/datasets" , "/sternadi/datasets/volume2" ],
        }

        mount { '/sternadi/nobackup/volume1':
                ensure  => 'mounted',
                device  => 'powersternadilabtmpfs.tau.ac.il:/sternaditmp/volume1',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/sternadi" , "/sternadi/nobackup" , "/sternadi/nobackup/volume1" ],
        }


	## Labs mounts
        file { [ "/work" , "/data.cc" , "/shokef" ]:
                ensure => 'directory',
        }

        mount { '/work':
                ensure  => 'mounted',
                device  => 'poweramirnatanfs.tau.ac.il:/amirnatan/data',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nosuid,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/work" ],
        }

        mount { '/data.cc':
                ensure  => 'mounted',
                device  => 'powermicronfs.tau.ac.il:/micron/data',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nosuid,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/data.cc" ],
        }

        mount { '/shokef':
                ensure  => 'mounted',
                device  => 'powershokeffs.tau.ac.il:/shokef/data',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nosuid,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/shokef" ],
        }


        file { [ "/andata" ]:
                ensure => 'directory',
        }

        file { [ "/tamir1" ]:
                ensure => 'directory',
        }
        file { [ '/tamir'  ]:
                ensure => 'directory',
        }

        file { [ '/tomerv'  ]:
                ensure => 'directory',
        }

        file { [ '/gcohenlab'  ]:
                ensure => 'directory',
        }

        file { [ "/a" , "/a/home" , "/a/home/cc" ]:
                ensure => 'directory',
        }


        mount { '/andata':
                ensure  => 'mounted',
                device  => '132.66.114.176:/andata',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,rsize=8192,wsize=8192,soft,bg,nodev,nfsvers=3,tcp',
                pass    => '0',
                require => File[ "/andata" ],
        }

        mount { '/tamir1':
                ensure  => 'mounted',
                device  => '132.66.114.26:/tamir1',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,rsize=8192,wsize=8192,soft,bg,nodev,nfsvers=3,tcp',
                pass    => '0',
                require => File[ "/tamir1" ],
        }

        mount { '/tomerv':
                ensure  => 'mounted',
                device  => '132.66.112.254:/tomerv',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,rsize=8192,wsize=8192,soft,bg,nodev,nfsvers=3,tcp',
                pass    => '0',
                require => File[ "/tomerv" ],
        }

        mount { '/gcohenlab':
                ensure  => 'mounted',
                device  => 'gcohenlabfs.tau.ac.il:/gcohenlab',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nosuid,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/gcohenlab" ],
        }

#        mount { '/tamir':
#                ensure  => 'mounted',
#                device  => 'tamir-nas.cs.tau.ac.il:/specific/tamir',
#                dump    => '0',
#                fstype  => 'nfs',
#                options => 'rw,rsize=8192,wsize=8192,soft,bg,nodev,nfsvers=3,tcp',
#                pass    => '0',
#                require => File[ "/tamir" ],
#        }

        mount { '/a/home/cc':
                ensure  => 'mounted',
                device  => 'gpm.tau.ac.il:/homecc',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nosuid,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/a" , "/a/home" , "/a/home/cc" ],
        }

        if ($this_is_a_pbs_server) {
                $mount_options='rw,rsize=8192,wsize=8192,soft,bg,nodev'
        }
        else {
                $mount_options='ro,rsize=8192,wsize=8192,soft,bg,nodev'
        }

               ## Powerapps folders
        file { [ "/powerapps"  ]:
                ensure => 'directory',
        }->

        mount { '/powerapps':
                ensure  => 'mounted',
                device  => 'ccapps.tau.ac.il:/ccapps/powerapps',
                dump    => '0',
                fstype  => 'nfs',
#                options => 'rw,rsize=8192,wsize=8192,soft,bg,nodev',
                options => $mount_options,
                pass    => '0',
                require => File[ "/powerapps" ],
        }->

        # remove power2 mount and link /export to /powerapps/export
        mount { '/export':
                ensure  => 'absent',
                device  => 'power2:/export',
                dump    => '0',
                fstype  => 'nfs',
                options => 'ro,soft,bg,nodev,nfsvers=3,tcp',
                pass    => '0',
        }->

        file{"/export":
        ensure=>link,
        target=>"/powerapps/export",
        force=>"true",
        }
 

}
