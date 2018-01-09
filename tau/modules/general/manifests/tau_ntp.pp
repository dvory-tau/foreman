class general::tau_ntp{

package {'ntp':
  ensure=>'installed',
}->
file{'/etc/ntp.conf':
content=>"server ntp.tau.ac.il",
}~>
service {'ntpd':
ensure=>'running',
enable=>'true',
}
}
