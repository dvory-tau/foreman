class astro::ibcheck {

	class { 'sudo':
 	 	purge               => false,
		config_file_replace => false,
	}

	sudo::conf { 'zabbix':
		priority => 10,
		content  => "zabbix    ALL=(zabbix-cluster) NOPASSWD: /storage/home/zabbix/ib_bw.sh",
	}

}

