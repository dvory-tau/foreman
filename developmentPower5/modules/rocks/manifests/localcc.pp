class rocks::localcc {

	include rocks::protection
	include rocks::zabbixagent

        #file { [ "/scratch100" , "/scratch200" , "/scratch300" ,"/usr/local.cc"]:
        file { "/usr/local.cc":
                ensure => 'directory',
        }

        #mount { '/usr/local.cc':
        #        ensure  => 'mounted',
        #        device  => 'ccapps.tau.ac.il:/ccapps/usr/local.linux',
        #        dump    => '0',
        #        fstype  => 'nfs',
        #        options => 'ro,rsize=8192,wsize=8192,hard,intr,bg,lock,tcp,nodev,nfsvers=3',
        #        pass    => '0',
#               require => File[ "/usr/local.cc" ],



        mount { '/usr/local.cc':
                ensure  => 'mounted',
                device  => 'ccapps.tau.ac.il:/ccapps/usr/local.linux',
                dump    => '0',
                fstype  => 'nfs',
                options => 'ro,rsize=8192,wsize=8192,hard,intr,bg,lock,tcp,nodev,actimeo=3,nfsvers=3',
                pass    => '0',
		require => File[ '/usr/local.cc' ],
        }

	#file { [ "/etc/zabbix/states" ]:
        #        ensure => 'directory',
       	#        mode => '0664',
	#	owner => 'zabbix',
	#	group => 'zabbix',
	#	require => Class[ "zabbix::agent" ],
        #}


	file { [ "/etc/zabbix/states/local.cc" ]:
		path => '/etc/zabbix/states/local.cc',
               	ensure => 'file',
                mode => '0775',
                owner => 'zabbix',
                group => 'zabbix',
		require => File[ "/etc/zabbix/states" ]
        }


}
