class general::nameserver($nameserver,$local_domain){
file{'/etc/resolv.conf':
content=>template('general/resolv.conf.erb'),
}

}#class
