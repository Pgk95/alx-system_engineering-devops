# this puppet script let you connect to a server without typing a password
file { '/root/.ssh/config':
  ensure  => present,
  content => "Host 54.237.51.224\n\
              IdentityFile ~/.ssh/school\n\
              PreferredAuthentications publickey\n\
              PasswordAuthentication no\n",
}
