class general::graylogFilebeatSender {

	require general::rsyslog
 
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
        source => 'puppet:///modules/general/filebeat.repo'
        }->

	package {'filebeat':
      ensure => installed,
    }->

	        file {'/etc/filebeat/filebeat.yml':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/general/filebeat.yml'
        }~> 

        service {'filebeat':
          ensure => running,
          enable => true,
          require => [ File[ "/etc/filebeat/filebeat.yml" ], Package[ "filebeat" ] ],
          } 

}
