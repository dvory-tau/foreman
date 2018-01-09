class power5::graylogFilebeatSender {

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
        source => 'puppet:///modules/power5/filebeat.repo'
        }->

        exec {'filebeat_upgrade':
        path    => ["/usr/bin", "/usr/sbin","/bin"],
	command => "yum upgrade filebeat -y",
      unless => "test -f /usr/share/filebeat/scripts/migrate_beat_config_1_x_to_5_0.py",
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
