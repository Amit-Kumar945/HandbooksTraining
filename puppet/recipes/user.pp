user { 'sandy':
    ensure           => 'present',
    home             => '/home/sandy',
    shell              => '/bin/bash',
    password     => '*',
    groups         => ['bin','sandy','adm','lp'],
    comment     => 'user for sandy'
}
