class workstations::sandy{

        package {'docker-io':
                ensure => installed,
        }->

        file {'/etc/sysconfig/docker':
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                source => 'puppet:///modules/workstations/sandy-docker'
        }->

        file { '/root/DockerFile':
                owner  => 'root',
                ensure => 'present',
                source => 'puppet:///modules/workstations/climt.docker'
        } ->

        file { '/data_storage/docker-mapper':
                ensure => 'directory',
                owner  => 'dockerroot',
                group  => 'dockerroot',
        } ->


        group { 'docker':
                ensure => 'present',
        } ->

        user { 'dvory1':
                groups          => [ 'docker', 'dockerroot' ],
                membership      => 'minimum',
        }

# Below makes an error of cycle in dependencies
 #       user { 'root':
 #               groups          => [ 'docker', 'dockerroot' ],
 #               membership      => 'minimum',
 #       }

        user { 'harnik':
                groups          => [ 'docker', 'dockerroot' ],
                membership      => 'minimum',
        }

        service {'docker':
                ensure => running,
                enable => true,
        }

}
