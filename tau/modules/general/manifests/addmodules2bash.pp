class general::addmodules2bash{

  exec {'addmodules2bash':

    command => "grep -q 'alias bash bash -l' /etc/csh.cshrc||echo 'alias bash bash -l'>>/etc/csh.cshrc",
    path    => ["/usr/bin", "/usr/sbin","/bin"],
    unless =>"grep -q 'alias bash bash -l' /etc/csh.cshrc",	

    }#exec

    }#add_modules2_bash

