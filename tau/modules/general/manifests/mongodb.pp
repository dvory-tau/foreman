class general::mongodb {

	file {'/etc/yum.repos.d/mongodb-org-3.4.repo':
        	ensure => present,
        	owner  => 'root',
        	group  => 'root',
        	mode   => '0644',
        	source => 'puppet:///modules/general/mongodb-org-3.4.repo'
        }->

	package {'mongodb-org':
      		ensure => installed,
    	}->

        service {'mongod':
        	ensure => running,
          	enable => true,
        } 

}
