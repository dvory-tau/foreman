class power::powersudo {
	class { 'sudo':
  		purge               => false,
  		config_file_replace => false,
	}
	sudo::conf { 'zabbix':
  		priority => 10,
  		content  => "zabbix  ALL=(root) NOPASSWD: /bin/ls -l /opt/torque/mom_priv/jobs/
Defaults!/bin/ls !requiretty",
	}
}
