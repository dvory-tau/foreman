class lecs::general()
{
	package {'tcsh-6.17-38.el6.x86_64':
		ensure => installed,
		provider => yum,
		install_options => ['--enablerepo=base'],
	}

	# Create swap only if does not exist already
	if "/usr/bin/test -e /state/partition1/swapfile" == 1 {
		exec {'generate-swap':
			command => "dd if=/dev/zero of=/state/partition1/swapfile bs=4096 count=5000000",
			path    => ["/usr/bin", "/usr/sbin","/bin"],
		} ->
        	exec {'generate-swap-cont1':
                	command => "mkswap /state/partition1/swapfile",
	                path    => ["/usr/bin", "/usr/sbin", "/bin", "/sbin"],
        	} ->
        	exec {'generate-swap-cont2':
                	command => "chmod 600 /state/partition1/swapfile",
                	path    => ["/usr/bin", "/usr/sbin", "/bin", "/sbin"],
        	} ->
        	exec {'generate-swap-cont3':
                	command => "swapon /state/partition1/swapfile",
                	path    => ["/usr/bin", "/usr/sbin", "/bin", "/sbin"],
        	} ->

        	exec {'add-swap-fstab':
                	command => "echo '/state/partition1/swapfile      none    swap    sw      0       0' >> /etc/fstab",
                	path    => ["/usr/bin", "/usr/sbin","/bin"],
        	}
	}
	if "/usr/bin/test -L /usr/share/Modules/modulefiles" {
		exec {'save-original-modules':
			command => "mv /usr/share/Modules/modulefiles /usr/share/Modules/modulefiles_orig",
			path	=>  ["/usr/bin", "/usr/sbin", "/bin", "/sbin"],
		} ->
		file { '/usr/share/Modules/modulefiles':
			ensure => link,
			target => '/share/apps/modules',
		}
	}
        file { "/usr/local.cc":
                path => '/usr/local.cc',
                ensure => 'directory',
                mode => '0755',
                owner => 'root',
                group => 'root',
        }

       file { '/etc/profile.d/bash_local.cc_path.sh':
                ensure  => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0755',
                source => "puppet:///modules/lecs/bash_local.cc_path.sh",
        }
       file { '/etc/profile.d/bash_local.cc_path.csh':
                ensure  => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0755',
                source => "puppet:///modules/lecs/bash_local.cc_path.csh",
        }

       file { '/etc/profile.d/z_add_modulepath.sh':
                ensure  => present,
                owner  => 'root',
                group  => 'root',
                mode   => '0755',
                source => "puppet:///modules/lecs/add_modulepath.sh",
        }

}#class
