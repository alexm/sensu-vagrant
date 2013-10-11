node 'server' {
  include rabbitmq

  package { 'redis-server':
    ensure => installed;
  }

  class { 'sensu':
    rabbitmq_password => 'secret',
    server            => true,
    plugins           => [
      'puppet:///data/sensu/plugins/ntp.rb',
      'puppet:///data/sensu/plugins/postfix.rb'
    ]
  }

  sensu::handler { 'default':
    command => 'mail -s "sensu alert" root@localhost',
  }

  sensu::check { 'check_ntp':
    command     => 'PATH=$PATH:/usr/lib/nagios/plugins check_ntp_time -H pool.ntp.org -w 30 -c 60',
    handlers    => 'default',
    subscribers => 'sensu-test'
  }
}

node 'client' {
  class { 'sensu':
    rabbitmq_password => 'secret',
    rabbitmq_host     => 'server',
    subscriptions     => 'sensu-test',
  }
}
