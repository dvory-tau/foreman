class general::disable_selinux{

require general::puppet_facts_dir

if ( $selinux_current_mode== 'enforcing') and (($operatingsystem == 'CentOS') or ($operatingsystem == 'RedHat')){

	exec {'disable_selinuxi':
	        path=>'/usr/bin/:/bin:/usr/sbin/',
	        command=>'setenforce 0',
	        returns=>['1','0'],
	}

}
if ( ! $selinux_disabled ) and (($operatingsystem == 'CentOS') or ($operatingsystem == 'RedHat')){

exec {'disable_selinux':
	path=>'/usr/bin/:/bin:/usr/sbin/',
	command=>'setenforce 0',
	returns=>['1','0'],
}->

exec {'disable_selinux_config':
	path=>'/usr/bin/:/bin:/usr/sbin/',
	command=>"sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux",
        returns=>['1','0'],
}->

        exec {'set_selinux_disabled_fact':
        path=>"/usr/bin/:/bin:/usr/sbin/",
        command=>"echo 'selinux_disabled=true'>/etc/facter/facts.d/selinux_disabled.txt",
        creates=>'/etc/facter/facts.d/selinux_disabled.txt',
        }

}#if (! $selinux_disabled) and ($operatingsystem == 'CentOS')
}#class
