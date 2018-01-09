class nshomron::path {

        ## Compute Node's  /share/apps/redis paths  
        file {'/etc/profile.d/redis.sh':
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                source => 'puppet:///modules/nshomron/redis.sh'
        } # file /etc/profile.d/redis.sh

        file {'/etc/profile.d/redis.csh':
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                source => 'puppet:///modules/nshomron/redis.csh'
        } # file /etc/profile.d/redis.csh
}
