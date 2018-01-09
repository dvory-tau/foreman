class general::ssh_no_host_check{

file_line{'ssh_no_host_check':
path => '/etc/ssh/ssh_config',
line => 'StrictHostKeyChecking no',
}

}
