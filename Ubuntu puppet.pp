$doc_root = "/files"

exec { 'apt-get update':
 command => '/usr/bin/apt-get update'
}

package {'firefox':
 ensure => "installed"
 }
 
package {'thunderbird':
 ensure => "installed"
 }
 
package {'apache2':
 ensure => "installed"
 }
 
package {'synaptic':
 ensure => "installed"
 }
 
 package {'thunderbird':
 ensure => "installed"
 }
 package {'gufw':
 ensure => "installed"
 }
 
 package {'gufw':
 ensure => "installed"
 }
 
 package {'conky':
 ensure => "installed"
 }
 
 package {'clamav':
 ensure => "installed"
 }
 
 user { 'AdminUser':
 	  ensure           => 'present',
      home             => '/home/AdminUser',
      groups            => 'sudo,filesgroup',
      password         => 'AdminUser123',
      password_max_age => '99999',
      password_min_age => '0',
      shell            => '/bin/bash',
    }
	
 user { 'NormalUser':
 	  ensure           => 'present',
      groups            => 'NormalUser,filesgroup',
      password         => 'NormalUser123',
      password_max_age => '99999',
      password_min_age => '0',
      shell            => '/bin/bash',
    }
 user { 'EvilUser':
 	  ensure           => 'present',
      groups            => 'EvilUser,filesgroup',
      password         => 'EvilUser123',
      password_max_age => '99999',
      password_min_age => '0',
      shell            => '/bin/bash',
    }
 user { 'GuestUser':
 	  ensure           => 'present',
      groups            => 'GuestUser,filesgroup',
      password         => 'GuestUser123',
      password_max_age => '99999',
      password_min_age => '0',
      shell            => '/bin/bash',
    }
	
file {$doc_root:
	ensure => "directory",
	owner => "root",
	group => "root",
	mode => 644
	}
	
file {$doc_root/AdminUser:
	ensure => "directory",
	owner => "AdminUser",
	group => "filesgroup",
	mode => 644
	}
	
file {$doc_root/NormalUser:
	ensure => "directory",
	owner => "NormalUser",
	group => "filesgroup",
	mode => 644
	}
	
file {$doc_root/GuestUser:
	ensure => "directory",
	owner => "GuestUser",
	group => "filesgroup",
	mode => 644
	}
	
file {$doc_root/EvilUser:
	ensure => "directory",
	owner => "EvilUser",
	group => "filesgroup",
	mode => 644
	}
	
service { 'apache2':
    ensure => 'running',
  }

service { 'clamav':
    ensure => 'running',
  }
	
	
	
	
	
	
	
	