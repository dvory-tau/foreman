class general::disable_firewall {

        if ($operatingsystemmajrelease == 7){
 		$firewallservice = 'firewalld'
        } else {
                $firewallservice = 'iptables'
        }


	service {$firewallservice: 
		ensure=>"stopped",
		enable=>"false",
	}

}
