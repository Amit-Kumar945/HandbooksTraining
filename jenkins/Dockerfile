FROM jenkins

COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/install-plugins.sh cobertura
ADD JobCreatorConfig.xml /tmp/config.xml
#RUN chown -R jenkins:root /var/jenkins_home/jobs/JobsCreator
