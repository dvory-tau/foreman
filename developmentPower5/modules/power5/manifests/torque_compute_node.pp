class power5::torque_compute_node{
  #enable cpusets
  #-> is ordring

#  file { '/dev/cpuset':
#    ensure => 'directory',
#  }->
#
#  mount { '/dev/cpuset':
#    ensure  => 'mounted',
#    fstype  => 'cpuset',
#    require => File[ "/dev/cpuset" ],
#  }->
#
#
#  package {'hwloc.x86_64':
#    ensure => 'installed',
#    provider => 'yum',
#    }->    #pack hwloc
#
#    package {'hwloc-devel.x86_64':
#      ensure => 'installed',
#      provider => 'yum',
#      }->     #pack hwloc
#
#
#      exec {'tar -zxvf /export/packs/torque-package-mom-linux-x86_64.tar.gz -C /':
#        unless => 'test -d /opt/torque',
#        path    => ["/usr/bin", "/usr/sbin","/bin"],
#
#        }->      #unpack mom on node
#
#        file { '/etc/init.d/pbs_mom':
#          source => 'puppet:///modules/power5/pbs_mom',
#          ensure  => present,
#          owner  => 'root',
#          group  => 'root',
#          mode   => '0555',
#          }->          #pbsmom service file
#
#          file { '/var/spool/torque/mom_priv/config':
#            source => 'puppet:///modules/power5/config',
#            ensure  => present,
#            owner  => 'root',
#            group  => 'root',
#            mode   => '0655',
#
#            }~>             #pbsmom service file
#
#            service {'pbs_mom':
#              enable => 'true',
#              ensure => 'running',
#
#              }#service pbsmom enable
#
#
              }#class
#
