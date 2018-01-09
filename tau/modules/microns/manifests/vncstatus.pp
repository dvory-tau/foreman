class microns::vncstatus{
	file{'/etc/skel/.login':
		ensure =>'present',
		content => "vncstatus",
		mode => '755',
	}

	file {'/usr/bin/vncstatus':
		ensure =>'present',
		source => 'puppet:///modules/microns/vncstatus',
		mode => '+x',
	}
}
