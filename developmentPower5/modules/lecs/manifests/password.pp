class lecs::password {

        include rocks::protection

	## Compute Node's  authorized_keys  
	file {'/root/.ssh/authorized_keys':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0600',
		source => 'puppet:///modules/lecs/authorized_keys'
        } # file /root/.ssh/authorized_keys

	user { 'root': 
  		ensure   => present,
  		password => '$6$kRsr72La$346I8XIovcAeBDYp.oMYphhFJ46yH3yjZTbetiiFdsQcE4oWkMaS7yzlj8sSS75Xxt.Qcqi1g44DREC1h/k5K1',
	}
}

