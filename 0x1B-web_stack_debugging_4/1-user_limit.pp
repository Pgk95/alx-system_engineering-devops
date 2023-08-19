# This manifest ables fixing high demand of files.

exec { 'increase-hard-file-limit-for-holberton-user':
  command => 'sed -i "/holberton hard/s/5/50000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
  unless  => 'grep -q "^holberton hard.*50000" /etc/security/limits.conf',
}

exec { 'increase-soft-file-limit-for-holberton-user':
  command => 'sed -i "/holberton soft/s/4/50000/" /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/'
  unless  => 'grep -q "^holberton soft.*50000" /etc/security/limits.conf',
}
