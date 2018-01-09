class gandalf::nfs {


        include rocks::protection

        file { [ "/scratch" , "/scratch2" ]:
                ensure => 'directory',
                mode => '1777',
        }


        mount { '/scratch':
                ensure  => 'mounted',
                device  => '/dev/sdb1',
                dump    => '0',
                fstype  => 'ext4',
                options => 'defaults',
                pass    => '0',
                require => File[ "/scratch" ],
        }
        mount { '/scratch2':
                ensure  => 'mounted',
                device  => '/dev/sda5',
                dump    => '0',
                fstype  => 'ext4',
                options => 'defaults',
                pass    => '0',
                require => File[ "/scratch2" ],
        }

}
