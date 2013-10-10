if ::ipaddress == '192.168.50.10' {
  include sensu::server
}
else {
  include sensu::client
}
