class general::ldapsearch{
package {'openldap-clients':
ensure=>'present',}

file_line {'ldap1':
path=>'/etc/openldap/ldap.conf',
line=>'URI ldap://ldap.tau.ac.il/',
}

file_line {'ldap2':
path=>'/etc/openldap/ldap.conf',
line=>'BASE o=tau',
}


}
