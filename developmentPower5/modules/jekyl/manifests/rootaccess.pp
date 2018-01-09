class jekyl::rootaccess {

        include rocks::protection

	## Compute Node's  authorized_keys  
	file {'/root/.ssh/authorized_keys':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0600',
		source => 'puppet:///modules/jekyl/authorized_keys'
        } # file /root/.ssh/authorized_keys

	user { 'root': 
  		ensure   => present,
  		password => '$6$x2IRVFx4$MOKwSwUGclvPUFxXhauMs06VI1XpbYeTTbXE/LJCvWK3plWiS8lfDSL.uqp./6oVtrzuSvCVUNQ/qlbDxcAIk/',
	}
}

