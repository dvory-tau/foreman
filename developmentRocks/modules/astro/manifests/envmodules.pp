class astro::envmodules {

  package { 'environment-modules': 
      ensure => 'installed' 
  }

  exec { "remove_old_modulefiles":
      #command => '/usr/bin/rm -fr /usr/share/Modules',
      command => '/usr/bin/mv /usr/share/Modules /usr/share/Modules.old',
      onlyif => '/usr/bin/test -d /usr/share/Modules && /usr/bin/test ! -L /usr/share/Modules',
      require => Package['environment-modules']
  }

  file { '/usr/share/Modules':
    ensure => 'link',
    target => '/share/apps/Modules',
    require => Exec['remove_old_modulefiles']
  }

  file { '/etc/profile.d/z_global_profile.sh':
    ensure => 'link',
    target => '/share/global_profile.sh',
  }

}
