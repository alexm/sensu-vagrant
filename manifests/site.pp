node 'server' {
  include sensu::server
}

node 'client' {
  include sensu::client
}
