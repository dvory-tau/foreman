class power::systemlimits {

        include rocks::protection

	## Compute Node's system wide limits
	file {'/etc/security/limits.conf':
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0644',
		source => 'puppet:///modules/power/compute-limits.conf'
        } # file /etc/security/limits.conf

        ## Compute Node's additional limit
        file {'/etc/security/limits.d/90-nproc.conf':
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0644',
                source => 'puppet:///modules/power/compute-90-nproc.conf'
        } # file /etc/security/limits.conf


}


