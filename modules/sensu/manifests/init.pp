class sensu {
  exec { 'import-sensu-apt-key':
    command => '/usr/bin/wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | /usr/bin/sudo apt-key add -',
    unless  => '/usr/bin/sudo apt-key list | grep -i sensu';
  }

  exec { 'apt-get update':
    command => '/usr/bin/sudo apt-get update';
  }

  file { '/etc/apt/sources.list.d/sensu.list':
    ensure  => present,
    content => 'deb http://repos.sensuapp.org/apt sensu main',
    require => Exec['import-sensu-apt-key'];
  }
}
