class general::puppet_facts_dir{

exec {'facter_d_dir':
path    => ['/bin','/usr/bin', '/usr/sbin',],
command =>'mkdir -p /etc/facter/facts.d/',
creates =>[ '/etc/facter/', '/etc/facter/facts.d/'],
}
 
#       file { [ '/etc/facter/', '/etc/facter/facts.d/']:
#	mode=>"600",
#        owner=>"root",
#        group=>"root",
#        ensure=>'directory',
#        recurse=>'true',
#        }

#ensure_resource('file',
#[ '/etc/facter/', '/etc/facter/facts.d/'],{
#mode=>"600",
#owner=>"root",
#group=>"root",
#ensure=>'directory',
#recurse=>'true',
#})#ensure

}
