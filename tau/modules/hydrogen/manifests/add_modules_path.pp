class hydrogen::add_modules_path {
	
        if ($operatingsystemmajrelease == 7){
		$module_prefix = 'c7'
	} else {
		$module_prefix = 'z'
	}

       	file { '/etc/profile.d/z_add_modulepath.sh':
         	ensure  => present,
         	owner  => 'root',
         	group  => 'root',
         	mode   => '0755',
         	source => "puppet:///modules/hydrogen/${module_prefix}_add_modulepath.sh",
        }
	 
       	file { '/etc/profile.d/z_add_modulepath.csh':
         	ensure  => present,
         	owner  => 'root',
         	group  => 'root',
         	mode   => '0755',
         	source => "puppet:///modules/hydrogen/${module_prefix}_add_modulepath.csh",
        }
}

