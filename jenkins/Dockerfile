from jenkins

ENV JAVA_OPTS='-Djenkins.install.runSetupWizard=false'

#Install docker cli
USER root
ADD https://get.docker.com/builds/Linux/i386/docker-latest /usr/bin/docker
RUN chmod +x /usr/bin/docker

USER jenkins

#An init script to setup a default admin user
COPY adminaccount.groovy /usr/share/jenkins/ref/init.groovy.d/admin-account.groovy

#Insalling the required plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# Creating initial set of jenkins job, SeedJob will create all the required jobs
COPY build/create-seed-job.groovy /usr/share/jenkins/ref/init.groovy.d/create-seed-job.groovy
RUN mkdir -p /usr/share/jenkins/ref/jobs/SeedJob/workspace/
COPY jobs/* /usr/share/jenkins/ref/jobs/SeedJob/workspace/

COPY jenkins-xml/*.xml ${JENKINS_HOME}/

USER root
RUN chown jenkins:jenkins $(find /usr/share/jenkins/ref -type f -name '*.groovy')
USER jenkins
