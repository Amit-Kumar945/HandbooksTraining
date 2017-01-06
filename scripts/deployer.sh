echo "Shutdown tomcat server"
/opt/tomcat/bin/shutdown.sh || service tomcat7 stop
sleep 10

echo "Delete old version of app"

rm -r /opt/tomcat/webapps/* || rm  -r /var/lib/tomcat7/webapps/*

echo "Copy artifat from temporary location to tomcat root"
cp /tmp/*.war /opt/tomcat/webapps/  ||  cp /tmp/*.war /var/lib/tomcat7/webapps/

echo "Start tomcat server again"
/opt/tomcat/bin/startup.sh ||  service tomcat7 start
