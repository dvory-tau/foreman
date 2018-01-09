class power::nfs {

        include rocks::protection

	#if 5 =~ Integer[1,10] {
	#  notify {"it's a number between 1 and 10":}
	#}



	## Scratch directories
        file { [ "/scratch100" , "/scratch200" , "/scratch300" ]:
                ensure => 'directory',
        }

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

	## Powerapps folders
	file { [ "/powerapps" , "/powerapps/share" ]:
                ensure => 'directory',
        }

	if ($this_is_a_pbs_server) {
		$mount_options='rw,rsize=8192,wsize=8192,soft,bg,nodev'
	}
	else {
                $mount_options='ro,rsize=8192,wsize=8192,soft,bg,nodev'
	}

        mount { '/powerapps/share':
                ensure  => 'mounted',
                device  => 'ccapps.tau.ac.il:/ccapps/powerapps/share',
                dump    => '0',
                fstype  => 'nfs',
#                options => 'ro,rsize=8192,wsize=8192,soft,bg,nodev',
                options => $mount_options,
                pass    => '0',
                require => File[ "/powerapps/share" ],
        }


	## Power Sternadi lab
        file { [ "/sternadi" , "/sternadi/home" , "/sternadi/home/volume1" , "/sternadi/datasets" , "/sternadi/datasets/volume1" , "/sternadi/datasets/volume2" , "/sternadi/nobackup" , "/sternadi/nobackup/volume1" ]:
                ensure => 'directory',
        }

        mount { '/sternadi/home/volume1':
                ensure  => 'mounted',
                device  => 'powersternadilabfs.tau.ac.il:/sternadi/home/volume1',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/sternadi" , "/sternadi/home" , "/sternadi/home/volume1" ],
        }

        mount { '/sternadi/datasets/volume1':
                ensure  => 'mounted',
                device  => 'powersternadilabfs.tau.ac.il:/sternadi/datasets/volume1',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/sternadi" , "/sternadi/datasets" , "/sternadi/datasets/volume1" ],
        }

        mount { '/sternadi/datasets/volume2':
                ensure  => 'mounted',
                device  => 'powersternadilabfs.tau.ac.il:/sternadi/datasets/volume2',
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

        file { [ "/tamir1", '/tamir' ]: #tamir
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
                options => 'rw,async,rsize=32768,wsize=32768,soft,bg,nodev,nfsvers=3,actimeo=3,tcp',
                pass    => '0',
                require => File[ "/tamir1" ],
        }

        mount { '/tamir':
                ensure  => 'mounted',
                device  => 'tamir-nas.cs.tau.ac.il:/specific/tamir',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,async,rsize=32768,wsize=32768,soft,bg,nodev,nfsvers=3,actimeo=3,tcp',
                pass    => '0',
                require => File[ "/tamir" ],
        }

        mount { '/a/home/cc':
                ensure  => 'mounted',
                device  => 'gpm.tau.ac.il:/homecc',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nosuid,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/a" , "/a/home" , "/a/home/cc" ],
        }


}
