class workstations::stromboli{

        file { [ "/state/partition1" , "/state/partition1/home" , "/state/partition1/home/pb" , "/state/partition1/home/pb/data" , "/state/partition1/home/pblab" , "/state/partition1/home/pblab/data" ]:
                ensure => 'directory',
        } ->

        # preferred symlink syntax
        file { '/export':
                ensure => 'link',
                target => '/state/partition1',
        } ->


        mount { '/state/partition1/home/pb/data':
                ensure  => 'mounted',
                device  => '132.66.42.5:/Data',
                dump    => '0',
                fstype  => 'nfs',
                options => 'soft,intr,bg,rw,rsize=8192,wsize=8192,nosuid,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
#                require => File[ "/export" , "/export/home" , "/export/home/pb" , "/export/home/pb/data" ],
        } ->

        mount { '/state/partition1/home/pblab/data':
                ensure  => 'mounted',
                device  => '132.66.42.5:/Data',
                dump    => '0',
                fstype  => 'nfs',
                options => 'soft,intr,bg,rw,rsize=8192,wsize=8192,nosuid,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
#                require => File[ "/export" , "/export/home" , "/export/home/pb" , "/export/home/pb/data" ],
        }

#        service {'docker':
#          ensure => running,
#          enable => true,
#          }

	exec {install_chrome:
		path=>'/bin:/usr/sbin:/usr/bin',
		command=>'wget http://chrome.richardlloyd.org.uk/install_chrome.sh;chmod u+x install_chrome.sh;./install_chrome.sh -f',
		logoutput=>'true',
		creates=>'/usr/bin/google-chrome',
		timeout=>0,
	}


        $packages = [ 'R', 'zlib' ]
#              'rpcbind', 'environment-modules', 'xorg-x11-xauth', 'mesa-libGLU', 'mesa-libGLU-devel',
#                    'zlib', 'zlib-devel', 'zlib-static',
#                    'ghostscript','ghostscript-fonts','libXfont','urw-fonts','xorg-x11-font-utils','lapack-devel','gcc-c++','grace','PyQt4','libXdmcp','xorg-x11-apps','libXtst','tmux','autojump','redhat-lsb-core'
#        ]

        package { $packages:
                ensure => 'installed',
#               require => [Package['zlib'], File[ '/lib64/libz.so.1' ]],
        }

}
