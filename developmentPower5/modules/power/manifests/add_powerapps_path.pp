class power::add_powerapps_path {

        include rocks::protection
        ## Compute Node's  powerapps paths  
        file {'/etc/profile.d/powerapps.sh':
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                source => 'puppet:///modules/power/powerapps.sh'
        } # file /etc/profile.d/powerapps.sh

        file {'/etc/profile.d/powerapps.csh':
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                source => 'puppet:///modules/power/powerapps.csh'
        } # file /etc/profile.d/powerapps.csh
}



