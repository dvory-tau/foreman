class general::params {

        $puppet_server = 'foreman.tau.ac.il'
        $puppet_environment = 'tau'
        $puppet_certname = $fqdn

  	$puppet_interval =  '720m'
  	$puppet_spaylimit = '720m'

	$puppet_agent_additional_settings = {lastrunfile => '/tmp/lastrun.yml { mode=0664 }'}
	$puppet_after_reboot_command = "/bin/sleep 1m; /usr/bin/pkill -SIGUSR1 puppet"

}

