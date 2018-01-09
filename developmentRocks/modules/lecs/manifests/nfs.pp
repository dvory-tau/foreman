class lecs::nfs {

        include rocks::protection

	## Scratch directories
        file { [ "/biodb" , "/bioseq" , "/bioseq/data" ]:
                ensure => 'directory',
        }

        mount { '/biodb':
                ensure  => 'mounted',
                device  => '10.3.200.10:/ibm/biodata/biodb',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,hard,bg,nodev,intr',
                pass    => '0',
                require => File[ "/biodb" ],
        }

        mount { '/bioseq':
                ensure  => 'mounted',
                device  => '10.3.200.10:/ibm/biodata/bioseq',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,hard,bg,nodev,intr',
                pass    => '0',
                require => File[ "/bioseq" ],
        }

        #mount { '/bioseq/data':
        #        ensure  => 'mounted',
        #        device  => 'biodata:/bioseq/data',
        #        dump    => '0',
        #        fstype  => 'nfs',
        #        options => 'rw,hard,bg,nodev,intr',
        #        pass    => '0',
        #        require => [ File[ "/bioseq/data" ], Mount["/bioseq"], ]
        #}

}
