class rafiki::envmodules {
	
       	file { '/etc/profile.d/z_add_modulepath.sh':
         	ensure  => present,
         	owner  => 'root',
         	group  => 'root',
         	mode   => '0755',
         	source => "puppet:///modules/rafiki/z_add_modulepath.sh",
        }
	 
       	file { '/etc/profile.d/z_add_modulepath.csh':
         	ensure  => present,
         	owner  => 'root',
         	group  => 'root',
         	mode   => '0755',
         	source => "puppet:///modules/rafiki/z_add_modulepath.csh",
        }
}

