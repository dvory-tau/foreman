class power5::pbsproclient {

	exec {'pbs_install':
		command         => "/usr/bin/yum -y install /powerapps/share/distrib/pbs/pbspro-client-14.0.1-0.x86_64.rpm",
		onlyif          => "/usr/bin/test ! -f /opt/pbs/bin/qsub",
		require		=> Mount[ '/powerapps/share' ],
	}

	file { [ '/var/spool/pbs', '/var/spool/pbs/mom_priv' ]: 
			ensure => 'directory',
	}

	file {'/var/spool/pbs/pbs_environment':
			ensure => present,
			source => 'puppet:///modules/astro/pbs_environment',
			require => File['/var/spool/pbs'],
		        owner  => 'root',
        		group  => 'root',
        		mode   => '0644',
        }

        file {'/var/spool/pbs/mom_priv/config':
                        ensure => present,
                        source => 'puppet:///modules/astro/mom_pbs_config',
                        require => File['/var/spool/pbs/mom_priv'],
                        owner  => 'root',
                        group  => 'root', 
                        mode   => '0644',
			notify  => Service[ 'pbs' ],
        }	


	file {'/etc/pbs.conf':
                        ensure => present,
                        source => 'puppet:///modules/astro/pbs_config',
                        owner  => 'root',
                        group  => 'root', 
                        mode   => '0644',
			notify  => Service[ 'pbs' ],
        }

	ensure_resource('file', '/etc/hosts', {'ensure' => 'present'})

	service {'pbs':
		enable => 'true',
		ensure => 'running',
		require => File[ '/var/spool/pbs/mom_priv/config', '/etc/pbs.conf', '/var/spool/pbs/pbs_environment', '/etc/hosts' ],
	}

}
