class rocks::module {


        include rocks::protection


	file {'/etc/profile.d/modules.csh':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0644',
		source => 'puppet:///modules/rocks/modules.csh'
        } # file /etc/profile.d/modules.csh

	file {'/etc/profile.d/modules.sh':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0644',
		source => 'puppet:///modules/rocks/modules.sh'
        } # file /etc/profile.d/modules.sh

	#tidy { "delete-txt-files-in-etc-modulefiles":
	#	path    => "/etc/modulefiles",
	#	recurse => false,
	#	rmdirs  => false,
	#}

}
