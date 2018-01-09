class general::biology_tools{

	package { ['BEDTools', 'samtools' ] :
		ensure => installed,
		provider => yum,
	} 

}#class
