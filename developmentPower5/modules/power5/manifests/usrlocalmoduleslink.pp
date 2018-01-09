class power5::usrlocalmoduleslink{

#file { '/export' :
#                ensure => 'directory',
#        }->
#
#mount { '/export':
#                ensure  => 'mounted',
#                device  => 'power2:/export',
#                dump    => '0',
#                fstype  => 'nfs',
#                options => 'ro,soft,bg,nodev,nfsvers=3,tcp',
#                pass    => '0',
#                require => File[ "/export" ],
#        }->

file{"/usr/local":
        ensure=>link,
        target=>"/powerapps/export/apps/local",
        force=>"true",
}

}
