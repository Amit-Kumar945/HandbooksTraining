echo "Shutdown tomcat server"
/opt/tomcat/bin/shutdown.sh
sleep 10

echo "Delete old version of app"

rm -r /opt/tomcat/webapps/ROOT/*

echo "Copy artifat from temporary location to tomcat root"
cp /tmp/*.war /opt/tomcat/webapps/ROOT/ 

echo "Start tomcat server again"
/opt/tomcat/bin/startup.sh
