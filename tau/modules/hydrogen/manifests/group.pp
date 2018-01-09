class hydrogen::group{

group { 'abrt':
  ensure => 'present',
  gid    => '173', 
}
group { 'adm':
  ensure => 'present',
  gid    => '4',   
}
group { 'audio':   
  ensure => 'present',
  gid    => '63',  
}
group { 'avahi':   
  ensure => 'present',
  gid    => '70',  
}
group { 'bin':
  ensure => 'present',
  gid    => '1',   
}
group { 'biouser': 
  ensure => 'present',
  gid    => '404', 
}
group { 'cdrom':   
  ensure => 'present',
  gid    => '11',  
}
group { 'cgred':   
  ensure => 'present',
  gid    => '995', 
}
group { 'chem-group':
  ensure => 'present',
  gid    => '521', 
}
group { 'chrony':  
  ensure => 'present',
  gid    => '987', 
}
group { 'chu':
  ensure => 'present',
  gid    => '513', 
}
group { 'cosby':   
  ensure => 'present',
  gid    => '520', 
}
group { 'daemon':  
  ensure => 'present',
  gid    => '2',   
}
group { 'danny':   
  ensure => 'present',
  gid    => '500', 
}
group { 'dbus':
  ensure => 'present',
  gid    => '81',  
}
group { 'dhcpd':   
  ensure => 'present',
  gid    => '177', 
}
group { 'dialout': 
  ensure => 'present',
  gid    => '18',  
}
group { 'dip':
  ensure => 'present',
  gid    => '40',  
}
group { 'disk':
  ensure => 'present',
  gid    => '6',   
}
group { 'dvory':   
  ensure => 'present',
  gid    => '523', 
}
group { 'einat':   
  ensure => 'present',
  gid    => '507', 
}
group { 'floppy':  
  ensure => 'present',
  gid    => '19',  
}
group { 'foreman-proxy':
  ensure => 'present',
  gid    => '398', 
}
group { 'ftp':
  ensure => 'present',
  gid    => '50',  
}
group { 'fuse':
  ensure => 'present',
  gid    => '415', 
}
group { 'games':   
  ensure => 'present',
  gid    => '20',  
}
group { 'gaussian':
  ensure => 'present',
  gid    => '44',  
}
group { 'gdm':
  ensure => 'present',
  gid    => '42',  
}
group { 'geoclue': 
  ensure => 'present',
  gid    => '988', 
}
group { 'gnome-initial-setup':
  ensure => 'present',
  gid    => '985', 
}
group { 'gqli':
  ensure => 'present',
  gid    => '505', 
}
group { 'guy':
  ensure => 'present',
  gid    => '512', 
}
group { 'inbal':   
  ensure => 'present',
  gid    => '522', 
}
group { 'inonshar':
  ensure => 'present',
  gid    => '504', 
}
group { 'jboss':   
  ensure => 'present',
  gid    => '405', 
}
group { 'kmem':
  ensure => 'present',
  gid    => '9',   
}
group { 'libstoragemgmt':
  ensure => 'present',
  gid    => '994', 
}
group { 'lock':
  ensure => 'present',
  gid    => '54',  
}
group { 'lp':
  ensure => 'present',
  gid    => '7',   
}
group { 'mail':
  ensure => 'present',
  gid    => '12',  
}
group { 'mailnull':
  ensure => 'present',
  gid    => '47',  
}
group { 'man':
  ensure => 'present',
  gid    => '15',  
}
group { 'manmohan':
  ensure => 'present',
  gid    => '518', 
}
group { 'mario':   
  ensure => 'present',
  gid    => '515', 
}
group { 'maui':
  ensure => 'present',
  gid    => '511', 
}
group { 'mem':
  ensure => 'present',
  gid    => '8',   
}
group { 'michalo2':
  ensure => 'present',
  gid    => '509', 
}
group { 'migliore':
  ensure => 'present',
  gid    => '514', 
}
group { 'misha':   
  ensure => 'present',
  gid    => '506', 
}
group { 'mordkov': 
  ensure => 'present',
  gid    => '1000',
}
group { 'nfsnobody':
  ensure => 'present',
  gid    => '65534',
}
group { 'nitzan':  
  ensure => 'present',
  gid    => '501', 
}
group { 'noa':
  ensure => 'present',
  gid    => '516', 
}
group { 'nobody':  
  ensure => 'present',
  gid    => '99',  
}
group { 'ntp':
  ensure => 'present',
  gid    => '38',  
}
group { 'oded':
  ensure => 'present',
  gid    => '510', 
}
group { 'ogodsi':  
  ensure => 'present',
  gid    => '517', 
}
group { 'postdrop':
  ensure => 'present',
  gid    => '90',  
}
group { 'postfix': 
  ensure => 'present',
  gid    => '89',  
}
group { 'postgres':
  ensure => 'present',
  gid    => '26',  
}
group { 'pulse':   
  ensure => 'present',
  gid    => '171', 
}
group { 'pulse-access':
  ensure => 'present',
  gid    => '991', 
}
group { 'pulse-rt':
  ensure => 'present',
  gid    => '990', 
}
group { 'puppet':  
  ensure => 'present',
  gid    => '52',  
}
group { 'renai':   
  ensure => 'present',
  gid    => '524', 
}
group { 'root':
  ensure => 'present',
  gid    => '0',   
}
group { 'rpc':
  ensure => 'present',
  gid    => '32',  
}
group { 'rpcuser': 
  ensure => 'present',
  gid    => '29',  
}
group { 'rtkit':   
  ensure => 'present',
  gid    => '172', 
}
group { 'santanum':
  ensure => 'present',
  gid    => '519', 
}
group { 'saslauth':
  ensure => 'present',
  gid    => '76',  
}
group { 'screen':  
  ensure => 'present',
  gid    => '84',  
}
group { 'setroubleshoot':
  ensure => 'present',
  gid    => '992', 
}
group { 'sge':
  ensure => 'present',
  gid    => '400', 
}
group { 'slocate': 
  ensure => 'present',
  gid    => '21',  
}
group { 'smmsp':   
  ensure => 'present',
  gid    => '51',  
}
group { 'sshd':
  ensure => 'present',
  gid    => '74',  
}
group { 'sssd':
  ensure => 'present',
  gid    => '986', 
}
group { 'stapdev': 
  ensure => 'present',
  gid    => '158', 
}
group { 'stapsys': 
  ensure => 'present',
  gid    => '157', 
}
group { 'stapusr': 
  ensure => 'present',
  gid    => '156', 
}
group { 'sys':
  ensure => 'present',
  gid    => '3',   
}
group { 'systemd-journal':
  ensure => 'present',
  gid    => '190', 
}
group { 'systemd-network':
  ensure => 'present',
  gid    => '192', 
}
group { 'tape':
  ensure => 'present',
  gid    => '30',  
}
group { 'tcpdump': 
  ensure => 'present',
  gid    => '72',  
}
group { 'tomcat':  
  ensure => 'present',
  gid    => '412', 
}
group { 'tss':
  ensure => 'present',
  gid    => '59',  
}
group { 'tty':
  ensure => 'present',
  gid    => '5',   
}
group { 'unbound': 
  ensure => 'present',
  gid    => '989', 
}
group { 'usbmuxd': 
  ensure => 'present',
  gid    => '113', 
}
group { 'users':   
  ensure => 'present',
  gid    => '100', 
}
group { 'utempter':
  ensure => 'present',
  gid    => '35',  
}
group { 'utmp':
  ensure => 'present',
  gid    => '22',  
}
group { 'vered':   
  ensure => 'present',
  gid    => '502', 
}
group { 'video':   
  ensure => 'present',
  gid    => '39',  
}
group { 'wheel':   
  ensure => 'present',
  gid    => '10',  
}
group { 'yoel':
  ensure => 'present',
  gid    => '503', 
}
group { 'yonatant':
  ensure => 'present',
  gid    => '508', 
}
group { 'zabbix':  
  ensure => 'present',
  gid    => '399', 
}
}
