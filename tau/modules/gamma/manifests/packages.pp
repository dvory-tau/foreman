class gamma::packages{ 


	$centos_packages = [ 'rpcbind', 'environment-modules', 'xorg-x11-xauth', 'mesa-libGLU', 'mesa-libGLU-devel', 
		    'zlib', 'zlib-devel', 'zlib-static',
		    'ghostscript','ghostscript-fonts','libXfont','urw-fonts','xorg-x11-font-utils','lapack-devel','gcc-c++','grace','PyQt4','libXdmcp','xorg-x11-apps','libXtst','tmux','autojump','redhat-lsb-core'
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

	$centos7_packages = ['glibc.i686','compat-libgfortran-41.x86_64','doxygen','libXcomposite','lsof', 'compat-openmpi16', 'mlocate', 'compat-libtiff3','hdf5-devel','compat-libmpc']
	
	package {$centos7_packages:
	ensure => 'installed',	
		}

	}
	
	file{'/lib/ld-linux-x86-64.so.2':
        ensure=>link,
        target=>'/lib64/ld-linux-x86-64.so.2',
        }
        
	ensure_packages(['scalapack-common','scalapack-openmpi','scalapack-openmpi-devel','blacs-openmpi','blacs-common','blacs-openmpi-devel', 'libnl', 'xmlsec1', 'xmlsec1-openssl', 'libpng12', 'java-1.8.0-openjdk-devel', 'xz-devel', 'bzip2', 'bzip2-devel', 'gdal', 'gdal-devel', 'proj', 'proj-epsg'], {'ensure' => 'present'})


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




