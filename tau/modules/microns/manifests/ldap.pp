class microns::ldap {

        file { '/a':
                ensure => 'link',
                target => '/data.cc/data/a',
        }
}
