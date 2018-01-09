class astro::packages {

  if versioncmp($::puppetversion,'3.6.1') >= 0 {

      $allow_virtual_packages = hiera('allow_virtual_packages',false)

      Package {
        allow_virtual => $allow_virtual_packages,
      }
  }

  $astropackages = [ 'ipmitool', 'ntp', 'net-tools', 'wget', 'nfs-utils', 'glusterfs', 'glusterfs-fuse', 'rsync', 'git' ]


  # X packages
  $xpackages = ['libXt', 'libXfixes', 'mesa-libGL', 'compat-libstdc++-33', 'libXmu', 'libXp', 'libXpm', 'libXrender', 'xorg-x11-xauth', 'xorg-x11-utils', 'xorg-x11-apps', 'mesa-libGLU', 'ghostscript', 'ghostscript-fonts', 'libXfont','urw-fonts','xorg-x11-font-utils','vim-common','screen' ]



  package { 'epel-release':
      ensure => 'installed'
  }

  #centos-release-gluster
  $glusterfspkgs = [ 'centos-release-gluster37', 'centos-release-storage-common' ]
  package { $glusterfspkgs:
      ensure => 'installed'
  }


  $packages_to_install = [ $astropackages, $xpackages ]

  package { $packages_to_install: require => Package[ 'epel-release' , $glusterfspkgs ], ensure => 'latest' }


  
  #package { $astropackages: require => Package[ 'epel-release' , $glusterfspkgs ], ensure => 'latest' }

  Package { ensure => 'installed' }

}
