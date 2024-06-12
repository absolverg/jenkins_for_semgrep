FROM jenkins/jenkins:lts-jdk17

USER root
RUN apt-get update && apt-get install -y python3 pipx
COPY docker_install.sh /docker_install.sh
RUN chmod +x /docker_install.sh
RUN /docker_install.sh

RUN groupadd -f docker
RUN usermod -aG docker jenkins

USER jenkins
RUN pipx ensurepath
RUN pipx install semgrep