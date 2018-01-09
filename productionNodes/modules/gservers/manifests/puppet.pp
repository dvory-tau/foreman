class gservers::puppet (
  $puppet_server = $gservers::params::puppet_server,
  $puppet_environment = $gservers::params::puppet_environment,
  $puppet_certname = $gservers::params::puppet_certname,
  $puppet_interval =  $gservers::params::puppet_interval,
  $puppet_interval_spaylimit = $gservers::params::puppet_spaylimit,
  $puppet_agent_additional_settings = $gservers::params::puppet_agent_additional_settings,
  $puppet_after_reboot_command = $gservers::params::puppet_after_reboot_command,
 ) inherits gservers::params {

	## configure puppet
	class { '::puppet':
  		agent => true,
  		server => false,
		agent_template => 'gservers/puppet_agent.conf.erb',
  		runmode => 'service',
		splay => true,
		splaylimit => $puppet_interval_spaylimit,
  		puppetmaster => $puppet_server,
  		environment => $puppet_environment,
  		runinterval => $puppet_interval,
		agent_additional_settings => $puppet_agent_additional_settings,
	}

	## run puppet right after reboot
	cron { puppet_run_after_rebbot:
          command => $puppet_after_reboot_command,
          user => "root",
          special => "reboot",
        }
	
}

