# this Puppet code creates file in '/tmp/school' containing the string.

file { '/tmp/school':
  ensure  => file,
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
  content => URI.encode_www_form_component('I love Puppet'),
}
