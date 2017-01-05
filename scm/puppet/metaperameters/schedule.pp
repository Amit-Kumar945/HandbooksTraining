schedule { 'nginxservice':
  range  => '2 - 4',
  period => daily,
  repeat => 1,
}

package	{ [ 'nginx' ]:	ensure => "installed" }

service	{ 'nginx':	
				ensure => "running",
				enable => "true",
				require => Package["nginx"],
}

exec { "restart":
                command => "/etc/init.d/nginx  restart",
 		schedule => 'nginxservice',
                require => Service['nginx'],
       }
