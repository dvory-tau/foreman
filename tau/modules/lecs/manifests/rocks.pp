class lecs::rocks()

{
	#check if rocks running
	{exec 'Checking rocks':
		path    => ["/bin", "/usr/bin", "/usr/sbin"],
	        command => "rocks set host boot $hostname action=install",


