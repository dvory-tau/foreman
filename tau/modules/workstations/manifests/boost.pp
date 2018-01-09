class workstations::boost{

        file { [ "/export" , "/export/home" , "/export/home/pb" , "/export/home/pb/data" ]:
                ensure => 'directory',
        }


        mount { '/export/home/pb/data':
                ensure  => 'mounted',
                device  => '132.66.42.5:/Data',
                dump    => '0',
                fstype  => 'nfs',
                options => 'soft,intr,bg,rw,rsize=8192,wsize=8192,nosuid,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/export" , "/export/home" , "/export/home/pb" , "/export/home/pb/data" ],
        }

        service {'docker':
          ensure => running,
          enable => true,
          }


}
