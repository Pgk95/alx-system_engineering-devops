class { 'nginx':
  service_manage => true,
}

file { '/etc/nginx/conf.d/custom_header.conf':
  ensure  => present,
  content => "server_tokens off;\n
              location / {\n
                add_header X-Served-By $hostname;\n
              }
  notify  => Class['nginx::service'],
}
