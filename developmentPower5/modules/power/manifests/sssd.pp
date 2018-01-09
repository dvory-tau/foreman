file { '/etc/sssd/sssd.conf':
  ensure => present,
  owner  => 'root',
  group  => 'root',
  mode   => '0600',
  source => 'puppet:///modules/power/sssd.conf',
}

