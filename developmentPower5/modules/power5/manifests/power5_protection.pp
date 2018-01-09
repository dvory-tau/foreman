class power5::power5_protection {

  $req_installer_headnode = 'power5'

  if ($installer_headnode == undef) or ($installer_headnode != $req_installer_headnode) {
 #   fail("Puppet class misuse ! Expecting cluster : \'$req_installer_headnode\',  but \'$installer_headnode\' has been found")

    notify {"we are on  $installer_headnode":}
 }  
                                            
    #    notify {"we are on  $installer_headnode":}
    }    


