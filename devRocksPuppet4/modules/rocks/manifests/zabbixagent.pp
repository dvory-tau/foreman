class rocks::zabbixagent(
  $zabbix_server =           	$rocks::params::zabbix_server,
  $zabbix_userparameterf =      $rocks::params::zabbix_userparameterf,
) inherits rocks::params { 

        include rocks::protection

        file { [ "/etc/zabbix/states" ]:
                ensure => 'directory',
                mode => '0664',
                owner => 'zabbix',
                group => 'zabbix',
                require => Class[ "zabbix::agent" ],
        }

}
