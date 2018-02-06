class lecs::nfs {


	## Scratch directories
        file { [ "/biodb" , "/bioseq" , "/bioseq/data" , "/groups/dorotheeh/data" ]:
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
/*        mount { '/bioseq/data/results':
                ensure  => 'mounted',
                device  => '10.3.200.10:/ibm/biodata/bioseqdata/results',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,hard,bg,nodev,intr',
                pass    => '0',
                require => File[ "/bioseq" ],
        }

*/
        mount { '/bioseq/data':
                ensure  => 'mounted',
                device  => 'biodata:/bioseq/data',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,hard,bg,nodev,intr',
                pass    => '0',
                require => [ File[ "/bioseq/data" ], Mount["/bioseq"], ]
        }

	mount {'/groups/dorotheeh/data':
	       ensure  => 'mounted',
                device  => '10.3.255.196:/data',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,hard,bg,nodev,intr',
                pass    => '0',
                require => File[ "/groups/dorotheeh/data" ],
        }

        file { [ "/share" , "/share/apps"]:
                ensure => 'directory',
        }->

        mount { '/share/apps':
                ensure  => 'mounted',
                device  => 'lecs2.local:/export/apps',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,nfsvers=3,sloppy',
                pass    => '0',
        }

# And autofs:
# Added by Dvory (as in productionRocks environment)
        file {'/etc/auto.share':
		#if the file is changed - trigger a restart to autofs service
		notify => Service['autofs'],
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                source => 'puppet:///modules/lecs/auto.share'
        }
	# Added by Dvory 5/2/2018
        file {'/etc/auto.groups':
                #if the file is changed - trigger a restart to autofs service
                notify => Service['autofs'],
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                source => 'puppet:///modules/lecs/auto.groups'
        }

	service { 'autofs':
	    	ensure  => 'running',
    		enable  => true,
 	 }

}

