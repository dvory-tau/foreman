class general::legato_backup ($legato_backup_enabled = false){

if $operatingsystem == 'Ubuntu' { 

$legato_pakage = 'lgtoclnt_8.2.1_amd64.deb' 

exec {"libxp6 repo":
        cwd=>'/root',
        path    => ['/bin','/usr/bin', '/usr/sbin'],
        command=>"add-apt-repository -y ppa:zeehio/libxp;apt-get update;apt-get install -y libxp6",
        unless          => "dpkg -l libxp6",
	returns=>'100',
        }->

package {['ksh','libstdc++5','libxp6']:
	ensure=>installed,
}->

exec {"$legato_pakage":
        cwd=>'/root',
        path    => ['/bin','/usr/bin', '/usr/sbin'],
        command=>"wget http://lininst.tau.ac.il/Legato/All/8.2.1/$legato_pakage;dpkg -i /root/lgtoclnt_8.2.1_amd64.deb;apt-get -y install -f;apt-get install -y lgtoclnt",
        unless          => "dpkg -l lgtoclnt",
        returns=>'100',
	}->


exec {"legato_pakage install2":
        cwd=>'/root',
        path    => ['/bin','/usr/bin', '/usr/sbin'],
        command=>"dpkg -i /root/lgtoclnt_8.2.1_amd64.deb",
        unless          => "dpkg -l lgtoclnt",
        returns=>'100',
        }

#this class needs ubuntu16 pakage !!!

#exec {'run execcd':}


}

elsif $operatingsystem == 'CentOS' or $operatingsystem == 'RedHat' {

$legato_pakage = 'lgtoclnt-8.2.1-1.x86_64.rpm'


	exec {"$legato_pakage":
		cwd=>'/root',
		path    => ['/bin','/usr/bin', '/usr/sbin'],
		command=>"wget http://lininst.tau.ac.il/Legato/All/8.2.1/$legato_pakage;yum install -y /root/lgtoclnt-8.2.1-1.x86_64.rpm",
		unless          => "rpm -q lgtoclnt",
		}

}


file {['/nsr','/nsr/res']:
	ensure=>directory,
	recurse=>true,
}->

file {'/nsr/res/servers':
#        ensure=>present,
#        source=>'puppet:///modules/common/legato_servers',
	content=>"legato.tau.ac.il",
}

if ($legato_backup_enabled){
	
	service {'networker':
	       ensure=>running,
	       enable=>true,
	}
}
else{
         service {'networker':
               ensure=>stopped,
               enable=>false,
        }

}
#exec {"start_legto_client":
#  command => 'ps -ef |grep [n]srexecd || /usr/sbin/service networker start',
#  onlyif => '/usr/bin/test -e /nsr/res/servers',
#}

}

