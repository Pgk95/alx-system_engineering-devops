# this Puppet code creates file in '/tmp/school' containing the string.

file { 'school':
  ensure  => 'present',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
  content => 'I love Puppet',
  path    => '/tmp/school'
}
