class power5::graylogFilebeatSender {

	require power5::rsyslog
 
         exec {'add elastic gpg key':
            command => "rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch",
            path    => ["/usr/bin", "/usr/sbin","/bin"],
                unless => "rpm -qa filebeat",
          }->

	file {'/etc/yum.repos.d/filebeat.repo':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/power5/filebeat.repo'
        }->

	package {'filebeat':
      ensure => installed,
      provider => yum,
    }->

	        file {'/etc/filebeat/filebeat.yml':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/power5/filebeat.yml'
        }~> 

        service {'filebeat':
          ensure => running,
          enable => true,
          require => [ File[ "/etc/filebeat/filebeat.yml" ], Package[ "filebeat" ] ],
          } 

}
