user { 'sandy':
    ensure           => 'present',
    home             => '/sbin',
    shell              => '/sbin/nologin',
    password     => '*',
    gid                => '2',
    groups         => ['bin','sandy','adm','lp'],
    comment     => 'user for sandy'
}
