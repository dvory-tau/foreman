class rocks::localcc {

	include rocks::protection
	include rocks::zabbixagent


        mount { '/usr/local.cc':
                ensure  => 'mounted',
                device  => 'ccapps.tau.ac.il:/ccapps/usr/local.linux',
                dump    => '0',
                fstype  => 'nfs',
                options => 'ro,rsize=8192,wsize=8192,hard,intr,bg,lock,tcp,nodev,actimeo=3,nfsvers=3',
                pass    => '0',
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
