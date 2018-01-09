class microns::mounts {
        file { ["/data.cc"]:
                ensure => 'directory',
        }
        mount { '/data.cc':
                ensure  => 'mounted',
                device  => 'micronfs.tau.ac.il:/micron',
                dump    => '0',
                fstype  => 'nfs',
                options => 'soft,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/data.cc" ],
        }

}

