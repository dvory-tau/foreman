class general::localcc {

        file { "/usr/local.cc":
                ensure => 'directory',
        }


        mount { '/usr/local.cc':
                ensure  => 'mounted',
                device  => 'ccapps.tau.ac.il:/ccapps/usr/local.linux',
                dump    => '0',
                fstype  => 'nfs',
                options => 'ro,rsize=8192,wsize=8192,hard,intr,bg,lock,tcp,nodev,actimeo=3,nfsvers=3',
                pass    => '0',
		require => File[ '/usr/local.cc' ],
        }

}
