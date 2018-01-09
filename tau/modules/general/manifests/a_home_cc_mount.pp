class general::a_home_cc_mount{

        file { [ "/a" , "/a/home" , "/a/home/cc" ]:
                ensure => 'directory',
        }


        mount { '/a/home/cc':
                ensure  => 'mounted',
                device  => 'gpm.tau.ac.il:/homecc',
                dump    => '0',
                fstype  => 'nfs',
                options => 'hard,intr,bg,rw,rsize=8192,wsize=8192,nosuid,nodev,nfsvers=3,lock,tcp',
#                options => 'soft,intr,bg,rw,rsize=8192,wsize=8192,nodev,nfsvers=3,lock,tcp',
                pass    => '0',
                require => File[ "/a" , "/a/home" , "/a/home/cc" ],
        }



}
