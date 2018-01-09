class lecs::nfs {

        include rocks::protection

	## Scratch directories
        file { [ "/biodb" , "/bioseq" , "/bioseq/data" , "/groups/dorotheeh/data" , "/share/apps"]:
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

        mount { '/share/apps':
                ensure  => 'mounted',
                device  => '10.3.1.1:/export/apps',
                dump    => '0',
                fstype  => 'nfs',
                options => 'defaults',
                pass    => '0',
                require => File[ "/share/apps" ],
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

	mount {'/groups/dorotheeh/data':
	       ensure  => 'mounted',
                device  => '10.3.255.196:/data',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,hard,bg,nodev,intr',
                pass    => '0',
                require => File[ "/groups/dorotheeh/data" ],
        }
# And autofs:
        file {'/etc/auto.share':
		#if the file is changed - trigger a restart to autofs service
		notify => Service['autofs'],
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                source => 'puppet:///modules/lecs/auto.share'
        }

	service { 'autofs':
	    	ensure  => 'running',
    		enable  => true,
 	 }

}
