class { 'customtomcat': 
port => "8090",
package => "tomcat7",
service => "tomcat7",
}

class { 'custommysql':}
