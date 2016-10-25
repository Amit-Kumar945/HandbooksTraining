host { 'sandyhost':
  name => 'sandy.example.com',
  ensure => 'present',
  comment => 'sandy server entry',
  ip => '127.0.0.1',
}
