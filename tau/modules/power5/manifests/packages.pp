class power5::packages{ 

	#require power5::power2_mount

	$centos_packages = [ 'nfs-utils', 'rpcbind', 'environment-modules', 'xorg-x11-xauth', 'mesa-libGLU', 'mesa-libGLU-devel', 'bwa',
		    'zlib', 'zlib-devel', 'zlib-static',
		    'ghostscript','ghostscript-fonts','libXfont','urw-fonts','xorg-x11-font-utils','lapack-devel','gcc-c++','grace','PyQt4','libXdmcp','xorg-x11-apps','libXtst','tmux','autojump'
	]

	package { $centos_packages:
      		ensure => 'installed',
#		require => [Package['zlib'], File[ '/lib64/libz.so.1' ]],
	}


	if ($operatingsystemmajrelease == 6){
    	file { '/lib64/libz.so.1':
        	ensure=>link,
	        target=>"/export/apps/local/zlib-1.2.8/lib/libz.so.1.2.8",
        	force=>"true",
	        require => [ Package['zlib'], Mount[ '/export' ] ],
	}
	}

	if ($operatingsystemmajrelease == 7){

# Dvory: Added specific version to install: java-1.8.0-openjdk-devel-1.8.0.121-0.b13.el7_3.x86_64
# -----------------------------
# since the latest version java-1.8.0-openjdk-devel-1.8.0.141-1.b16.el7_3.x86_64   - failed to run (node compute-0-183), with below error, when running talimc job
# the R search path for lib included old version
#
# Error : .onLoad failed in loadNamespace() for 'rJava', details:
#  call: dyn.load(file, DLLpath = DLLpath, ...)
#  error: unable to load shared object '/powerapps/share/R/R-3.3.2/lib64/R/library/rJava/libs/rJava.so':
#  libjvm.so: cannot open shared object file: No such file or directory
#Error: package ‘rJava’ could not be loaded
#Execution halted
# Need to be updated again - to latest version, as soon as problem is resolved
# xterm was added for the benefit of AtomEye (user: gkovel)
	$centos7_packages = ['glibc.i686','compat-libgfortran-41.x86_64','doxygen','xterm','libXcomposite','lsof', 'compat-openmpi16', 'mlocate', 'compat-libtiff3', 'java-1.8.0-openjdk-devel-1.8.0.121-0.b13.el7_3.x86_64']
	
		package {$centos7_packages:
			ensure => 'installed',	
		}

	}

        # preferred symlink syntax
        file { '/usr/lib64/libmpi.so.4':
                ensure => 'link',
                target => '/usr/lib64/compat-openmpi16/lib/libmpi.so.1',
        }

	
	file{'/lib/ld-linux-x86-64.so.2':
	        ensure=>link,
        	target=>'/lib64/ld-linux-x86-64.so.2',
        }

#Added by dvory : directory /state/partition1 -> /export
#        file{'/state':
#                ensure => 'directory',
#                target => '/export',
#        }->
       
#        file{'/state/partition1':
#                ensure => link,
#                target => '/export',
#        }
#<-- End of added by Dvory
#valgrind - profiling tool added per gianluca's request

	ensure_packages(['scalapack-common','scalapack-openmpi','blacs-common','libnl', 'xmlsec1', 'xmlsec1-openssl', 'libpng12', 'java-1.8.0-openjdk-devel', 'xz-devel', 'bzip2', 'bzip2-devel', 'gdal', 'gdal-devel', 'proj', 'proj-epsg', 'valgrind' ], {'ensure' => 'present'})

	exec {'install_libstdc5':
		path=>'/bin:/usr/sbin:/usr/bin',
		command=>'wget ftp://195.220.108.108/linux/centos/7.3.1611/os/x86_64/Packages/compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm;yum localinstall -y compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm',
		creates=>'/usr/lib64/libstdc++.so.5',
	}

#Added by Dvory oracle jdk9 for hadaszur
	file { '/root/jdk-9.0.1_linux-x64_bin.rpm':
		ensure  => present,
		owner  => 'root',
		group  => 'root',
		mode   => '0755',
		source => 'puppet:///modules/power5/jdk-9.0.1_linux-x64_bin.rpm',
	} ->

	exec {'install_oracle_jdk':
		path=>'/bin:/usr/sbin:/usr/bin',
		command=>'yum localinstall -y /root/jdk-9.0.1_linux-x64_bin.rpm',
	}



}#class//




/*
	package {'nfs-utils':
		provider=>yum,
		ensure => installed,
        }
package {'nfs-utils-lib':
provider=>yum,
ensure => installed,
        }->

service {'rpcbind':
        ensure=>running,
        }

 package { 'libXt.i686':   ensure => 'installed' }
 package { 'libXt.x86_64':   ensure => 'installed' }
 package { 'libXfixes.i686':   ensure => 'installed' }
 package { 'libXfixes.x86_64':   ensure => 'installed' }
 package { 'mesa-libGL.i686':   ensure => 'installed' }
 package { 'mesa-libGL.x86_64':   ensure => 'installed' }
 
 package { 'environment-modules':   ensure => 'installed' }
 package { 'compat-libstdc++-33.x86_64':   ensure => 'installed' }

 package { 'compat-libstdc++-33-3.2.3-69.el6':   ensure => 'installed' }

 package { 'libXmu.x86_64':   ensure => 'installed' }
 package { 'libXp.x86_64':   ensure => 'installed' }
 package { 'libXpm.x86_64':   ensure => 'installed' }
 package { 'libXrender.x86_64':   ensure => 'installed' }

 package { 'xorg-x11-xauth': ensure=> 'installed' }
 package { 'xorg-x11-utils': ensure=> 'installed' }
 package { 'xorg-x11-apps': ensure=> 'installed' }

 package { 'mesa-libGLU': ensure=> 'installed' }
 package { 'mesa-libGLU-devel': ensure=> 'installed' }


 package { ['ghostscript','ghostscript-fonts','libXfont','urw-fonts','xorg-x11-font-utils']: ensure=> 'installed' }

# Added gfortran lib installation for R
 package { 'compat-libgfortran-41-4.1.2-39.el6.i686': ensure=> 'installed' }
 package { 'compat-libgfortran-41-4.1.2-39.el6.x86_64': ensure=> 'installed' }

#Added by Dvory: libXss.so.1 for lumerical:
 package { 'libXScrnSaver-1.2.2-2.el6.i686': ensure=> 'installed' }
 package { 'libXScrnSaver-1.2.2-2.el6.x86_64': ensure=> 'installed' }

 package { 'xmlsec1-1.2.20-4.el6.x86_64': ensure=> 'installed' }
 package { 'xmlsec1-openssl-1.2.20-4.el6.x86_64': ensure=> 'installed' }

 file { '/lib/ld-linux-x86-64.so.2':
	ensure => link,
	target => '/lib64/ld-linux-x86-64.so.2',
  }

#install zlib and make sure that it links libz.so.1 from local dir:

  package { 'zlib.x86_64': ensure=> 'installed' }
  package { 'zlib-devel.x86_64': ensure=> 'installed' }
  package { 'zlib-static.x86_64': ensure=> 'installed' }
    file { '/lib64/libz.so.1':
        ensure=>link,
        target=>"/export/apps/local/zlib-1.2.8/lib/libz.so.1.2.8",
        force=>"true",
	require => Package['zlib.x86_64'],
}
*/




