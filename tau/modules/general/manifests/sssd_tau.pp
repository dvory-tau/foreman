class general::sssd_tau($sssd_login_shell,$sssd_conf_line1)
{

  package {'sssd-common':
    ensure => installed,
#    provider => yum,
#    install_options => ['--enablerepo=base'],
    } 

    package {'sssd-client':
      ensure => installed,
#      provider => yum,
#      install_options => ['--enablerepo=base'],
    }

    package {'sssd':
      ensure => installed,
#      provider => yum,
#      install_options => ['--enablerepo=base'],
    } 

    file {'/etc/nsswitch.conf':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      require => Package['sssd'],
      source => 'puppet:///modules/general/nsswitch.conf'
      } 


      file {'/etc/sssd/sssd.conf':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0600',
        require => Package['sssd'],
        #source => 'puppet:///modules/general/sssd.conf'
        content=> template('general/sssd.conf.erb')
	} ~>

        service {'sssd':
          ensure => running,
          enable => true,
          require => [ File[ "/etc/sssd/sssd.conf" ], Package[ "sssd" ] ],
          } ->      

          exec {'set-authconfig-enableldap':
            command => "grep -q 'USELDAP=yes' /etc/sysconfig/authconfig|| authconfig --enableldap --update",
            path    => ["/usr/bin", "/usr/sbin","/bin"],
		unless => "grep -q 'USELDAP=yes' /etc/sysconfig/authconfig",
          } 

          exec {'set-authconfig-enableldapauth':
            command => "grep -q 'USELDAPAUTH=yes' /etc/sysconfig/authconfig|| authconfig --enableldapauth --update",
            path    => ["/usr/bin", "/usr/sbin","/bin"],
		unless => "grep -q 'USELDAPAUTH=yes' /etc/sysconfig/authconfig",
          }



          }#class
