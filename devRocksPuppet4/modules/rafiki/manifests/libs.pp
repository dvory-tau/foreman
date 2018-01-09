class rafiki::libs {
## Compute Node's  library 
file {'/etc/ld.so.conf.d/intel.conf':
ensure => present,
owner  => 'root',
group  => 'root',
mode   => '0644',
source => 'puppet:///modules/rafiki/intel.conf'
        } # file /etc/ld.so.conf.d/intel.conf
}
