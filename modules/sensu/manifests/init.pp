class sensu {
  include apt

  apt::source { 'sensu':
    location    => 'http://repos.sensuapp.org/apt',
    release     => 'sensu',
    repos       => 'main',
    include_src => false,
    key         => '7580C77F',
    key_source  => 'http://repos.sensuapp.org/apt/pubkey.gpg';
  }
}
