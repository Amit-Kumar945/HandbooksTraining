package {"tomcat7":
    ensure => present
}

service {"tomcat7":
    ensure => running
}
