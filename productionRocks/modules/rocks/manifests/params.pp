class rocks::params {
  # Rocks cluster headnode requred. If it doesnt change It will create an alarm
  $rocks_headnode_req = 'change_me_to_real_headnode_value'

  # Rocks hosts tpl filename
  $rocks_tpl_hosts = 'rocks/hosts.tpl'

  #Puppet defaults
  $rocks_puppet_env = 'production'

  # Set network defaults
  $rocks_network_defaultgw =	'132.66.114.1'
  $rocks_network = 		'132.66.114.0'
  $rocks_network_mask =		'255.255.254.0'
  $rocks_network_dns = 		'132.66.17.135'

  # Set network IB defaults
  $rocks_ib_network = '192.168.0.0'
  $rocks_ib_mask = '255.255.0.0'
  $rocks_ib_netpattern = '192.168.2.XXX'
  $rocks_ib_is_opensm_server = false

  # Root access defaults
  $rocks_file_authorized_keys = ''
  $rocks_root_pwd = ''


  # Zabbix detail
  $zabbix_server =           	'zabbix.tau.ac.il'

  # SmartD default
  $smartd_disks = sda

}
