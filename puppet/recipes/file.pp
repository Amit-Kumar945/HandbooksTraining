file { '/tmp/sandy.txt':
  ensure => 'present',
  owner => 'sandy',
  group => 'sandy',
  mode => '0666',
}
