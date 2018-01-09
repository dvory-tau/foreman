class rocks::globalpaths {

	include rocks::protection

	file {'/etc/csh.cshrc':
		ensure => present,
        }->
	file_line { 'Adding global paths to all nodes':
		path => '/etc/csh.cshrc',  
		line => 'source /share/apps/nodes-global.csh',
		match   => "^source /share/apps/nodes-global.csh",
	} # file /etc/csh.cshrc

}

