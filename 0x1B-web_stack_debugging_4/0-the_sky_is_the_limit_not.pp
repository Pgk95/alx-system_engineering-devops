# fixes sets of requests to run without errors
exec { 'Replace':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/',
}

exec { 'Restart':
  command => 'sudo service nginx restart',
  path    => '/etc/init.d/',
}
