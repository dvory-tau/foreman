class power5::kernelyumlock{
    
        exec {'kernelyumlock':

                command => "grep 'exclude=.*kernel.*' /etc/yum.conf||echo 'exclude=*kernel*'>>/etc/yum.conf",
                   path    => ["/usr/bin", "/usr/sbin","/bin"],

                                  }#exec
                                    
                                    }#lockkernel
