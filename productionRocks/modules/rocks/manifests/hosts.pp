class rocks::hosts (
  $rocks_tpl_hosts =           $rocks::params::rocks_tpl_hosts,
 ) inherits rocks::params {
        include rocks::protection

        ## Hosts file  
        file {'/etc/hosts':
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                content => template($rocks_tpl_hosts),
         } # file /etc/hosts
}
