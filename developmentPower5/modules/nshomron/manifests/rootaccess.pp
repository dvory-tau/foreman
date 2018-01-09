class nshomron::rootaccess {

        include rocks::protection

	## Compute Node's  authorized_keys  
	file {'/root/.ssh/authorized_keys':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0600',
		source => 'puppet:///modules/nshomron/authorized_keys'
        } # file /root/.ssh/authorized_keys

	user { 'root': 
  		ensure   => present,
  		password => '$6$4djQUWg5$Gm2r2IzrHZBnBUl6fJk4QBMlu2vBIuz6TSFomLsIKp9gcdzzA3BYmo/mupsBcIUYs5WbFcHtBNczjw7c5A.Ij1',
	}
}

