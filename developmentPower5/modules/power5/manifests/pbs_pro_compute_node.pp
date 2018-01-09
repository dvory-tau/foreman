class power5::pbs_pro_compute_node{
#-> is ordring
#service pbs stop;tar -zxf /export/pbs_client.tar.gz -C /;rpm -i --replacefiles --noscripts --relocate /usr/pbs=/opt/pbs /export/PBSPro_13.0.2/linux26_x86_64/pbs-mom-13.0.2.153173-0.x86_64.rpm;service pbs start

#/etc/pbs.conf
#/etc/init.d/pbs
#/var/spool/PBS
#/opt/pbs
#rpm -i --replacefiles --noscripts --relocate /usr/pbs=/opt/pbs /export/PBSPro_13.0.2/linux26_x86_64/pbs-mom-13.0.2.153173-0.x86_64.rpm
#
#        file {  "/export":
#                ensure => 'directory',
#        }
#
#        mount { '/export':
#                ensure  => 'mounted',
#                device  => 'power7.local:/export',
#                dump    => '0',
#                fstype  => 'nfs',
#                options => 'ro,soft,bg,nodev,nfsvers=3,tcp',
#                pass    => '0',
#                require => File[ "/export" ],
#        }
	if $operatingsystem == "CentOS" {
	if ($operatingsystemmajrelease == 6){

		require power5::nfs

		exec {'tar -zxf /powerapps/export/pbs_client.tar.gz -C /':
			unless => 'test -f /etc/pbs.conf',
		       	path    => ["/usr/bin", "/usr/sbin","/bin"],
		}->      #unpack mom on node

		exec {'rpm -i --replacefiles --noscripts --relocate /usr/pbs=/opt/pbs /export/PBSPro_13.0.2/linux26_x86_64/pbs-mom-13.0.2.153173-0.x86_64.rpm':
			unless => 'test -f /opt/pbs/bin/qsub',
		       	path    => ["/usr/bin", "/usr/sbin","/bin"],

		}->
	
	        file { '/var/spool/PBS/mom_priv/config':
         		ensure  => present,
		        owner  => 'root',
         		group  => 'root',
         		mode   => '0644',
         		source => 'puppet:///modules/power5/config',
        	}~>
		service {'pbs':
			enable => 'true',
			ensure => 'running',
		}#service pbsmom enable and running
	} #centos6
        if ($operatingsystemmajrelease == 7) {
	#if ($lsbmajdistrelease == 7){
		exec {'pbs_install':
			command         => "/usr/bin/yum -y install /export/distrib/pbspro/Centos${operatingsystemmajrelease}/pbspro-execution.rpm",
			onlyif          => "/usr/bin/test ! -f /opt/pbs/bin/qsub",
			require		=> Mount [ '/export' ],
		}

		file { [ '/var/spool/PBS', '/var/spool/PBS/mom_priv' ]: 
			ensure => 'directory',
		}

		file {'/var/spool/PBS/pbs_environment':
			ensure => present,
			source => 'puppet:///modules/power5/pbs_environment',
			require => File['/var/spool/PBS'],
		        owner  => 'root',
        		group  => 'root',
        		mode   => '0644',
        	}

	        file {'/var/spool/PBS/mom_priv/config':
                        ensure => present,
                        source => 'puppet:///modules/power5/config',
                        require => File['/var/spool/PBS/mom_priv'],
                        owner  => 'root',
                        group  => 'root', 
                        mode   => '0644',
			notify  => Service[ 'pbs' ],
        	}	


		file {'/etc/pbs.conf':
                        ensure => present,
                        source => 'puppet:///modules/power5/pbs_config',
                        owner  => 'root',
                        group  => 'root', 
                        mode   => '0644',
			notify  => Service[ 'pbs' ],
        	}

		ensure_resource('file', '/etc/hosts', {'ensure' => 'present'})

		service {'pbs':
			enable => 'true',
			ensure => 'running',
			require => File[ '/var/spool/PBS/mom_priv/config', '/etc/pbs.conf', '/var/spool/PBS/pbs_environment', '/etc/hosts' ],
			subscribe => Exec [ 'pbs_install' ],
		}

	} #Centos7

	} #centos


}#class
