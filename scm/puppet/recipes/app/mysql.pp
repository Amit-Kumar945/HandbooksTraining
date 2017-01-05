package {"mysql-server":
    ensure => present
}

service {"mysql":
    ensure => running
}

exec {"create database":
     require => Service['mysql'],
    command => '/usr/bin/mysql -e "CREATE DATABASE IF NOT EXISTS employeedb"'
}


exec {"Set root user password":
    require => Service['mysql'],
    command => '/usr/bin/mysql -uroot -e "SET PASSWORD FOR \'root\'@\'%\' = PASSWORD(\'password\');"'
}

exec {"Set root user password for local":
    require => Service['mysql'],
    command => '/usr/bin/mysql -uroot -e "SET PASSWORD FOR \'root\'@\'localhost\' = PASSWORD(\'password\');"'
}


