# execute 'apt-get update'
exec { 'apt-update':                    # exec resource named 'apt-update'
  command => '/usr/bin/apt-get update'  # command this resource will run
}

# install ufw package
package { 'ufw':
  require => Exec['apt-update'],        # require 'apt-update' before installing
  ensure => installed,
}

# ensure ufw service is running
service { 'ufw':
  ensure => running,
} 
