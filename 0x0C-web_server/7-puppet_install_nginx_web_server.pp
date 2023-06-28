# install nginx package
package { 'nginx':
  ensure => installed,
}

file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
    server {
      listen 80;
      server_name _;

      location /redirect_me {
        return 301
      }

      location / {
        root   /var/www/html;
        index index.html;
      }
    }
  ",
  require => Package['nginx'],
}


service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/sites-available/default'],
}

file {'/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World',
}
