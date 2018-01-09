class astro::pbspro (
  $pbspro_execute = $astro::params::pbspro_execute,
 ) inherits astro::params {


	# install pbs execute node
	if ($pbspro_execute) {

		exec {'pbs_install':
			command         => "/usr/bin/yum -y install /share/distrib/pbspro/pbspro-execution.rpm",
			onlyif          => "/usr/bin/test ! -f /opt/pbs/bin/qsub",
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

		#ensure_resource('file', '/etc/hosts', {'ensure' => 'present'})

		service {'pbs':
			enable => 'true',
			ensure => 'running',
			require => File[ '/var/spool/pbs/mom_priv/config', '/etc/pbs.conf', '/var/spool/pbs/pbs_environment' ],
		}

	} # if ($pbspro_execute)
	else {
 		file{'/tmp/non_exists_file':
			ensure => 'absent',
		}
	}


        #exec {"PBSPRO ${pbspro_execute}":
        #    command         => "/bin/true",
        #    user            => root,
        #    path            => ['/usr/bin','/usr/sbin','/bin','/sbin'],
        #}


}
