# Resource type: datadog_agent::ubuntu::install_key
#
# This resource type install repository keys in Ubuntu
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#
#
define datadog_agent::ubuntu::install_key() {
  $shortkey =  regsubst($name, '.*(.{8})$', '\1')

  exec { "key ${name}":
    command => "/usr/bin/apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ${name}",
    unless  => "/usr/bin/apt-key list | grep ${shortkey} | grep expires",
  }
}
