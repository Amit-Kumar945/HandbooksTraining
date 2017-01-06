#$user = "sandeep"
file { '/tmp/sandy.txt':
  ensure => 'present',
  owner => 'sandy',
  group => 'sandy',
  mode => '0666',
  content => template('/root/recipes/index.erb')
}
