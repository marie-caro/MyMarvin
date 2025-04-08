FROM jenkins/jenkins:latest
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/my_marvin.yml

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --clean-download-directory --list --view-security-warnings -f /usr/share/jenkins/ref/plugins.txt

COPY my_marvin.yml /var/jenkins_home/my_marvin.yml
COPY job_dsl.groovy /var/jenkins_home/job_dsl.groovy
