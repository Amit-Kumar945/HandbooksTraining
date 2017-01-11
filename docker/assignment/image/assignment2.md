- Create Tomcat Docker Image using Dockerfile
    - Use tomcat as base docker image
    - Define author name and mail id info
    - Your image should have telnet, vim and curl
    - Add a war file at /usr/local/tomcat/webapps/app.war
    - Add labels "role=app", "env=dev"
    - Make /usr/local/tomcat/logs persistent
    - Make "/usr/share/tomcat/webapps" as the default directory

- Run a container using the image and link to mysql container created previously and make sure that app works fine
