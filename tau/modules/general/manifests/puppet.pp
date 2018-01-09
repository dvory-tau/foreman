class general::puppet (
  $puppet_server = $general::params::puppet_server,
  $puppet_environment = $general::params::puppet_environment,
  $puppet_certname = $general::params::puppet_certname,
  $puppet_interval =  $general::params::puppet_interval,
  $puppet_interval_spaylimit = $general::params::puppet_spaylimit,
  $puppet_agent_additional_settings = $general::params::puppet_agent_additional_settings,
  $puppet_after_reboot_command = $general::params::puppet_after_reboot_command,
 ) inherits general::params {

	## configure puppet
	class { '::puppet':
  		agent => true,
  		server => false,
		agent_template => 'general/puppet_agent.conf.erb',
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

