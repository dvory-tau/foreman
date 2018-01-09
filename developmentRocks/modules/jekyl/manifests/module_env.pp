class jekyl::module_env {

##        include rocks::protection

	## 
        file { '/modulefiles':
                ensure => 'directory',
        }

        mount { '/modulefiles':
                ensure  => 'mounted',
                device  => '10.2.1.1:/usr/share/Modules/modulefiles',
                dump    => '0',
                fstype  => 'nfs',
                options => 'rw,hard,bg,nodev,intr',
                pass    => '0',
                require => File[ '/modulefiles' ],
        }

	file { '/usr/share/Modules/modulefiles',
		ensure => 'link',
		target => '/modulefiles',
       		force  => 'true',	## this directory exists, need to become a symlink
		require => Mount [ '/modulefiles' ],
	}
}
