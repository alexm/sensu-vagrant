class sensu::client inherits sensu {
  package { 'sensu':
    ensure => installed;
  }
}
