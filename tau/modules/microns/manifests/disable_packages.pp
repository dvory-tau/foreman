class microns::disable_packages{
package{'PackageKit':
provider => 'yum',
ensure=>'purged',
}
service{'polkit':
ensure=>'stopped',
enable=>'false',
}
}#class
