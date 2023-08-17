# This manifest ables fixing high demand of files.

exec { 'Change':
  command => 'sudo sed -i 's/nofile 7/nofile 70000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/',
}

exec { 'Replace':
  command => 'sudo sed -i 's/nofile 6/nofile 60000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/',
}
