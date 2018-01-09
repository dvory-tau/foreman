class hydrogen::hosts  {
        file {'/etc/hosts':
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                content => template('hydrogen/hosts.tpl'),
         } # file /etc/hosts
}

