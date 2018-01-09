class common::legato_backup {

if $operatingsystem == 'Ubuntu' { $legato_pakage = 'lgtoclnt_8.2.1_amd64.deb' }

elsif $operatingsystem == 'CentOS' {$legato_pakage = 'lgtoclnt-8.2.1-1.x86_64.rpm'}



file {"/nsr/$legato_pakage":
	ensure=>present,
	source=>"puppet:///modules/common/$legato_pakage",
	
}->


package { 'lgtoclnt':
	ensure=>installed,
	provider=>"dpkg",
	source=>'/nsr/lgtoclnt_8.2.1_amd64.deb',
}->

file {'/nsr/res/servers':
	ensure=>present,
	source=>'puppet:///modules/common/legato_servers',
}->

service {'networker':
	ensure=>running;
}


#exec {"start_legto_client":
#  command => 'ps -ef |grep [n]srexecd || /usr/sbin/service networker start',
#  onlyif => '/usr/bin/test -e /nsr/res/servers',
#}

}
