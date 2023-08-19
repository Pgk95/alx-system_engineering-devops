# fixes sets of requests to run without errors
exec { 'Increase':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/'
}

exec { 'Restart':
  command => 'nginx restart',
  path    => '/etc/init.d/'
}
