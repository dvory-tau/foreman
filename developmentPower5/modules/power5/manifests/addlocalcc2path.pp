class power5::addlocalcc2path {

        file { '/etc/profile.d/bash_local.cc_path.sh':
         ensure  => present,
         owner  => 'root',
         group  => 'root',
         mode   => '0755',
         source => 'puppet:///modules/power5/bash_local.cc_path.sh',
        }
	 
       file { '/etc/profile.d/bash_local.cc_path.csh':
         ensure  => present,
         owner  => 'root',
         group  => 'root',
         mode   => '0755',
         source => 'puppet:///modules/power5/bash_local.cc_path.csh',
        }
}
