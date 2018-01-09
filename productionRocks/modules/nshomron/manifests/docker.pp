class nshomron::docker {

        file {'/etc/sysconfig/docker':
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                source => 'puppet:///modules/nshomron/docker'
        }->

        file { '/root/tensorflow.docker':
                owner  => 'root',
                ensure => 'present',
                source => 'puppet:///modules/nshomron/tensorflow.docker'
        } ->

        file { '/root/tensorflowfull.docker':
                owner  => 'root',
                ensure => 'present',
                source => 'puppet:///modules/nshomron/tensorflowfull.docker'
        } ->

        file { '/state/partition1/docker-mapper':
		ensure => 'directory',
                owner  => 'dockerroot',
                group  => 'dockerroot',
        } ->

        package {'docker-io':
                ensure => installed,
        }->

        service {'docker':
                ensure => running,
                enable => true,
        } ->

	group { "docker":
		ensure => 'present',
	} ->

	user { "dvory":
		groups		=> [ 'docker', 'dockerroot' ],
		membership	=> 'minimum',
	}
        user { "artemd":
                groups          => [ 'docker', 'dockerroot' ],
                membership      => 'minimum',
        }

}

