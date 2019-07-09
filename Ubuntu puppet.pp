
exec { 'apt-get update':
 command => '/usr/bin/apt-get update'
}

package {'firefox':
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
 
 package {'conky':
 ensure => "installed"
 }
 
 package {'clamav':
 ensure => "installed"
 }
 
 group{ 'filesgroup':
	ensure => 'present',
	}
	
 user { 'AdminUser':
 	  ensure           => 'present',
      home             => '/home/AdminUser',
      groups            => ['sudo''filesgroup'],
      password         => 'AdminUser123',
      password_max_age => '99999',
      password_min_age => '0',
      shell            => '/bin/bash',
    }
	
 user { 'NormalUser':
 	  ensure           => 'present',
      groups            => ['filesgroup'],
      password         => 'NormalUser123',
      password_max_age => '99999',
      password_min_age => '0',
      shell            => '/bin/bash',
    }
 user { 'EvilUser':
 	  ensure           => 'present',
      groups            => ['filesgroup'],
      password         => 'EvilUser123',
      password_max_age => '99999',
      password_min_age => '0',
      shell            => '/bin/bash',
    }
 user { 'GuestUser':
 	  ensure           => 'present',
      groups            => ['filesgroup'],
      password         => 'GuestUser123',
      password_max_age => '99999',
      password_min_age => '0',
      shell            => '/bin/bash',
    }
	
file {'/files':
	ensure => "directory",
	owner => "root",
	group => "root",
	mode => "770",
	}
	
file {'/files/AdminUser':
	ensure => "directory",
	owner => "AdminUser",
	group => "filesgroup",
	mode => 770,
	require => User['AdminUser'],
	}
	
file {'/files/NormalUser':
	ensure => "directory",
	owner => "NormalUser",
	group => "filesgroup",
	mode => "770",
	require => User['NormalUser'],
	}
	
file {'/files/GuestUser':
	ensure => "directory",
	owner => "GuestUser",
	group => "filesgroup",
	mode => "770",
	require => User['GuestUser'],
	}
	
file {'/files/EvilUser':
	ensure => "directory",
	owner => "EvilUser",
	group => "filesgroup",
	mode => "770",
	require => User['EvilUser'],
	}
file { '/files/AdminUser/hello.txt':  
  ensure  => file,
  content => "hello, world\n",
}
file { '/files/NormalUser/hello.txt':  
  ensure  => file,
  content => "hello, world\n",
}
file { '/files/GuestUser/hello.txt':  
  ensure  => file,
  content => "hello, world\n",
}
file { '/files/EvilUser/hello.txt':  
  ensure  => file,
  content => "hello, world\n",
}
service { 'apache2':
    ensure => 'running',
	require => Package['apache2'],
  }

service { 'clamav':
    ensure => 'running',
	require => Package['clamav'],
  }
	
	
	
	
	
	
	
	