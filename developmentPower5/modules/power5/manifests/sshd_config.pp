class power5::sshd_config{

      file {'/etc/ssh/sshd_config':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0600',
        source => 'puppet:///modules/power5/sshd_config'
        } ~>

        service {'sshd':
          ensure => running,
          enable => true,
          require =>  File[ '/etc/ssh/sshd_config' ],
          }       



          }#class
