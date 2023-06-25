file { '/root/.ssh/config':
  ensure  => present,
  content => "Host your_server\n\
              HostName 54.172.106.217\n\
              User ubuntu\n\
              IdentityFile ~/.ssh/school\n\
              PreferredAuthentications publickey\n\
              PasswordAuthentication no\n",
  mode    => '0600',
  owner   => 'root',
  group   => 'root',
}

