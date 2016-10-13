FROM jenkins

COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/install-plugins.sh job-dsl:1.51
RUN /usr/local/bin/install-plugins.sh maven-plugin:2.7.1
