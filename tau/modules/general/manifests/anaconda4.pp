class general::anaconda4{

#	require general::env_modules

	# Download anaconda
	exec { 'download_anaconda4':
		cwd	=> '/usr/local/src',
		command => 'wget https://repo.continuum.io/archive/Anaconda3-4.3.0-Linux-x86_64.sh',
		path	=> ["/bin", "/usr/bin", "/usr/sbin"],
		onlyif  => 'test ! -f /usr/local/src/Anaconda3-4.3.0-Linux-x86_64.sh',
	} ->
	exec { 'run_setup':
		cwd	=> '/usr/local/src',
		command => 'bash https://repo.continuum.io/archive/Anaconda3-4.3.0-Linux-x86_64.sh -b -p /usr/local/bin/python3_anaconda',
	} ->

	# Make anaconda a module:
        file {  '/usr/share/Modules/modulefiles/python':
#	file { "${modules_dir}/modulefiles/python":
		ensure => 'directory'
	} ->

	file { '/usr/share/Modules/modulefiles/python/anaconda_python3':
                ensure => 'present',
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                source => 'puppet:///modules/general/anaconda4_module'
         } # file anaconda module file
		

}#class
