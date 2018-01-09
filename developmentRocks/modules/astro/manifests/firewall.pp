class astro::firewall (
  $firewall_enabled = $astro::params::firewall_enabled,
 ) inherits astro::params {

  if ($firewall_enabled){
	service {"firewalld":
                ensure=>"running",
                enable=>"true",
        }
  }  else {
        service {"firewalld":
                ensure=>"stopped",
                enable=>"false",
        }
  }
}

