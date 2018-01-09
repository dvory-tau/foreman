class rafiki::nfs {

        include rocks::protection



## Scratch directories
        file { [ "/scratch1" , "/scratch2" , "/export" ]:
                ensure => 'directory',
        }

        mount { '/scratch1':
                ensure  => 'mounted',
                device  => 'rafiki2.local:/scratch1',
                dump    => '0',
                fstype  => 'nfs',
                options => 'defaults',
                pass    => '0',
                require => File[ "/scratch1" ],
        }

        mount { '/scratch2':
                ensure  => 'mounted',
                device  => 'rafiki2.local:/scratch2',
                dump    => '0',
                fstype  => 'nfs',
                options => 'defaults',
                pass    => '0',
                require => File[ "/scratch2" ],
        }

        mount { '/export':
                ensure  => 'mounted',
                device  => 'rafiki2.local:/export',
                dump    => '0',
                fstype  => 'nfs',
                options => 'ro,soft,bg,nodev,nfsvers=3,tcp',
                pass    => '0',
                require => File[ "/export" ],
        }

        mount { '/opt':
                ensure  => 'mounted',
                device  => 'rafiki2.local:/state/partition1/home/opt/',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw',
                pass    => '0',
        }
}
