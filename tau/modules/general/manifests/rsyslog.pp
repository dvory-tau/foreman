class general::rsyslog {

    file {'/etc/rsyslog.conf':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/general/rsyslog.conf'
      }~> 


        service {'rsyslog':
          ensure => running,
          enable => true,
          require => File[ "/etc/rsyslog.conf" ]
          }       

          }#class
