class power5::docker{

  ensure_packages('docker', {'ensure' => 'present'})

        service {'docker':
          ensure => running,
          enable => true,
          }

# Dvory: Adding docker group, and users for it
group { 'docker':
	  ensure => 'present',
     }
 user { ["dvory", "yaelyair1", "zurhadas2"]:
      groups            => 'docker',
    }

# Need to restart docker in order for the change to take place
#Dvory - however - it does not
        file { '/etc/group':
                notify => Service['docker'],
        }

}

