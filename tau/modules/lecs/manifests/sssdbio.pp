class lecs::sssdbio {

	file_line { 'tls':
	ensure => present,
	path => '/etc/sssd/sssd.conf',
	line =>	'ldap_id_use_start_tls = False',
	match => 'ldap_id_use_start_tls = ',
	}
	file_line { 'ldap_uri':
	ensure => present,
	path => '/etc/sssd/sssd.conf',
	line => 'ldap_uri = ldap://ldap.tau.ac.il/',
	match => 'ldap_uri =',
	}
	file_line { 'sssdbio':
   	path => '/etc/sssd/sssd.conf',
	after             =>'ldap_default_authtok = lkkhulihgexgmlkhekgxh',
   	line => 'ldap_user_home_directory = tauBioClusterHomeDirectory',
	}
	file_line { 'autofs_provider':
	path => '/etc/sssd/sssd.conf',
	after => 'ldap_default_authtok = lkkhulihgexgmlkhekgxh',
	line =>'autofs_provider = ldap',
	}
	file_line { 'autofs':
	ensure => present,
	path => '/etc/sssd/sssd.conf',
	after => '[sssd]',
	line => 'services = nss, pam, autofs',
	match => 'services = ',
	}
}
