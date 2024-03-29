package {'firefox':
 ensure => "installed",
 source => 'C:/installers/Firefox Setup 67.0.4.exe',
 install_options => ['/S'],
 }


 package {'thunderbird':
 ensure => "installed",
  source => 'C:/installers/Thunderbird Setup 60.7.2.exe',
   install_options => ['/S'],
 }
 
  package {'NotePad++':
 ensure => "installed",
  source => 'C:/installers/npp.7.7.1.Installer.exe',
   install_options => ['/S'],
 }

 group{ 'filesgroup':
ensure => 'present',
name => 'filesgroup',
members => ['AdminUser','cis527'],
}

 user { 'AdminUser':
 	 ensure           => 'present',
      groups            => ['Administrators','Users'],
      password         => 'AdminUser123',
      password_max_age => '99999',
      password_min_age => '0',
    }

 user { 'NormalUser':
 ensure           => 'present',
      groups            => ['Users'],
      password         => 'NormalUser123',
      password_max_age => '99999',
      password_min_age => '0',
    }
 user { 'EvilUser':
 	ensure           => 'present',
      groups            => ['Users'],
      password         => 'EvilUser123',
      password_max_age => '99999',
      password_min_age => '0',
    }
 user { 'GuestUser':
 	 ensure           => 'present',
      groups            => ['Guests'],
      password         => 'GuestUser123',
      password_max_age => '99999',
      password_min_age => '0',
    }

file {'c:/files':
ensure => "directory",
owner => "cis527",
group => "filesgroup",
mode => "777",
}

file {'c:/files/AdminUser':
ensure => "directory",
owner => "AdminUser",
group => "filesgroup",
mode => "770",
require => User['AdminUser'],
}

file {'c:/files/NormalUser':
ensure => "directory",
owner => "NormalUser",
group => "filesgroup",
mode => "770",
require => User['NormalUser'],
}

file {'c:/files/GuestUser':
ensure => "directory",
owner => "GuestUser",
group => "filesgroup",
mode => "770",
require => User['GuestUser'],
}

file {'c:/files/EvilUser':
ensure => "directory",
owner => "EvilUser",
group => "filesgroup",
mode => "770",
require => User['EvilUser'],
}

file { 'c:/files/AdminUser/hello.txt':  
  ensure  => file,
  mode => "770",
  content => "hello, world\n",
}
file { 'c:/files/NormalUser/hello.txt':  
  ensure  => file,
  mode => "770",
  content => "hello, world\n",
}
file { 'c:/files/GuestUser/hello.txt':  
  ensure  => file,
  mode => "770",
  content => "hello, world\n",
}
file { 'c:/files/EvilUser/hello.txt':  
  ensure  => file,
  mode => "770",
  content => "hello, world\n",
}

service { 'wuauserv':
    ensure => 'running',
  }
service { 'Dnscache':
    ensure => 'running',
  }

service { 'Dhcp':
    ensure => 'running',
  }

