class jekyl::module_env {

        include rocks::protection

	## 
        file { '/modulefiles':
                ensure => 'directory',
		before => Mount['/modulefiles'],
        }

        mount { '/modulefiles':
                ensure  => 'mounted',
                device  => '10.2.1.1:/usr/share/Modules/modulefiles',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,hard,bg,nodev,intr',
                pass    => '0',
                require => File['/modulefiles'],
        }

## this directory exists, need to become a symlink
	file { '/usr/share/Modules/modulefiles':
		ensure => 'link',
		target => '/modulefiles',
		force  => 'true',
		require => Mount['/modulefiles'],
	}
}

