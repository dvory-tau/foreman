class gamma::hosts  {
        file {'/etc/hosts':
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                content => template('gamma/hosts.tpl'),
         } # file /etc/hosts
}

