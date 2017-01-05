# Class: custommysql
# ===========================
#
# Full description of class custommysql here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'custommysql':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class custommysql {

	package {"mysql-server":
    		ensure => present
	}

	exec {"startmysql":
    		command => '/etc/init.d/mysql start',
    		require => Package['mysql-server']
	}
	
	file {"createscript": 
		path => "/tmp/database.sh",
		mode => "777", 
		source => "/root/modules/$module_name/file/database.sh"
	}

	exec {"databaseScript":
     		require => [ Exec['startmysql'], File['createscript'] ],
    		command => "/bin/bash -c '/tmp/database.sh'"
	}
}
