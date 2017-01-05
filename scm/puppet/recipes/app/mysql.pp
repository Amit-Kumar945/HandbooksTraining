package {"mysql-server":
    ensure => present
}

exec {"startmysql":
    command => '/etc/init.d/mysql start',
    require => Package['mysql-server']
}

exec {"databaseScript":
     require => Exec['startmysql'],
    command => "/bin/bash -c '/root/recipes/database.sh'"
}

