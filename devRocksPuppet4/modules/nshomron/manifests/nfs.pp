class nshomron::nfs {


        include rocks::protection

        file { [ "/homecc" ]:
                ensure => 'directory',
                mode => '0755',
        }


        mount { '/homecc':
                ensure  => 'mounted',
                device  => 'goliath.hosting.storage.tau.ac.il:/homecc',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nosuid,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/homecc" ],
        }

        ## Mount dir for vivan site
        file { [ "/bioseq" ]:
                ensure => 'directory',
        }

	file { '/bioseq/data':
                ensure => 'link',
                target => '/genomicslab/nobackup/volume1/bioseq_data/data',
                require => File[ "/bioseq" ],
	}



	## Mounting datasets

	file { [ "/genomicslab" , "/genomicslab/home", "/genomicslab/home/volume1", "/genomicslab/home/volume2",
		 "/genomicslab/datasets/", "/genomicslab/datasets/volume1", "/genomicslab/datasets/volume2",
		 "/genomicslab/datasets/volume3", "/genomicslab/datasets/volume4", "/genomicslab/datasets/volume5",
		 "/genomicslab/datasets/volume6", 
		 "/genomicslab/nobackup", "/genomicslab/nobackup/volume1", "/genomicslab/nobackup/volume2" ]:
		ensure => 'directory',
	}

	mount { '/genomicslab/home/volume1':
		ensure  => 'mounted',
		device  => 'genomicslab1fs.hosting.storage.tau.ac.il:/genomicslab/home/volume1',
		dump    => '0',
		fstype  => 'nfs',
		options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
		pass    => '0',
		require => File[ "/genomicslab" , "/genomicslab/home" , "/genomicslab/home/volume1" ],
	}

	mount { '/genomicslab/home/volume2':
		ensure  => 'mounted',
		device  => 'genomicslab1fs.hosting.storage.tau.ac.il:/genomicslab/home/volume2',
		dump    => '0',
		fstype  => 'nfs',
		options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
		pass    => '0',
		require => File[ "/genomicslab" , "/genomicslab/home" , "/genomicslab/home/volume2" ],
	}


	mount { '/genomicslab/datasets/volume1':
		ensure  => 'mounted',
		device  => 'genomicslab1fs.hosting.storage.tau.ac.il:/genomicslab/datasets/volume1',
		dump    => '0',
		fstype  => 'nfs',
		options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
		pass    => '0',
		require => File[ "/genomicslab" , "/genomicslab/datasets" , "/genomicslab/datasets/volume1" ],
	}

	mount { '/genomicslab/datasets/volume2':
		ensure  => 'mounted',
		device  => 'genomicslab1fs.hosting.storage.tau.ac.il:/genomicslab/datasets/volume2',
		dump    => '0',
		fstype  => 'nfs',
		options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
		pass    => '0',
		require => File[ "/genomicslab" , "/genomicslab/datasets" , "/genomicslab/datasets/volume2" ],
	}

	mount { '/genomicslab/datasets/volume3':
		ensure  => 'mounted',
		device  => 'genomicslab1fs.hosting.storage.tau.ac.il:/genomicslab/datasets/volume3',
		dump    => '0',
		fstype  => 'nfs',
		options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
		pass    => '0',
		require => File[ "/genomicslab" , "/genomicslab/datasets" , "/genomicslab/datasets/volume3" ],
	}

	mount { '/genomicslab/datasets/volume4':
		ensure  => 'mounted',
		device  => 'genomicslab1fs.hosting.storage.tau.ac.il:/genomicslab/datasets/volume4',
		dump    => '0',
		fstype  => 'nfs',
		options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
		pass    => '0',
		require => File[ "/genomicslab" , "/genomicslab/datasets" , "/genomicslab/datasets/volume4" ],
	}

	mount { '/genomicslab/datasets/volume5':
		ensure  => 'mounted',
		device  => 'genomicslab1fs.hosting.storage.tau.ac.il:/genomicslab/datasets/volume5',
		dump    => '0',
		fstype  => 'nfs',
		options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
		pass    => '0',
		require => File[ "/genomicslab" , "/genomicslab/datasets" , "/genomicslab/datasets/volume5" ],
	}

	mount { '/genomicslab/datasets/volume6':
		ensure  => 'mounted',
		device  => 'genomicslab1fs.hosting.storage.tau.ac.il:/genomicslab/datasets/volume6',
		dump    => '0',
		fstype  => 'nfs',
		options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
		pass    => '0',
		require => File[ "/genomicslab" , "/genomicslab/datasets" , "/genomicslab/datasets/volume6" ],
	}


	mount { '/genomicslab/nobackup/volume1':
		ensure  => 'mounted',
		device  => 'genomicslab1fs.hosting.storage.tau.ac.il:/genomicslab/nobackup/volume1',
		dump    => '0',
		fstype  => 'nfs',
		options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
		pass    => '0',
		require => File[ "/genomicslab" , "/genomicslab/nobackup" , "/genomicslab/nobackup/volume1" ],
	}

	mount { '/genomicslab/nobackup/volume2':
		ensure  => 'mounted',
		device  => 'genomicslab1fs.hosting.storage.tau.ac.il:/genomicslab/nobackup/volume2',
		dump    => '0',
		fstype  => 'nfs',
		options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
		pass    => '0',
		require => File[ "/genomicslab" , "/genomicslab/nobackup" , "/genomicslab/nobackup/volume2" ],
	}

	## Create /a/home /groups trees
	file { [ "/a" , "/a/home", ]:
                ensure => 'directory',
        }


	file { '/groups':
		ensure => 'link',
		target => '/genomicslab/home/volume1/nshomrons_groups',
		require => Mount[ "/genomicslab/home/volume1" ],
	}

	file { '/a/home/cc':
		ensure => 'link',
		target => '/genomicslab/home/volume1/nshomrons_group_homes/cc',
		#require => [ Mount[ "/genomicslab/home/volume1" ], File[ "/a" ], File[ "/a/home" ], ],
		require => [ File[ "/a" , "/a/home" ], Mount["/genomicslab/home/volume1"], ]
	}

}
