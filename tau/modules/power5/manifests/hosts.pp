class power5::hosts  {
        file {'/etc/hosts':
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                content => template('power5/hosts.tpl'),
         } # file /etc/hosts
}
