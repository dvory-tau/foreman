class general::env_modules{

	$modules_dir = '/usr/share/Modules'
	package {'environment-modules':
		ensure 		=> installed,
		provider	=> yum,
	}

	# concatenation of variable and string: "${<var>}<str>", and must have double quote
	file { [$modules_dir, "${modules_dir}/modulefiles"]:
		ensure => 'directory'
	} ->

	file { '/etc/profile.d/modules.csh':
		ensure => 'link',
		target => "${modules_dir}/init/csh",
	}

}#class
