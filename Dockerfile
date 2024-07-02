FROM jenkins/jenkins:lts-jdk17

USER root
RUN apt-get update && apt-get install -y python3 pipx

COPY TF_install.sh /root/TF_install.sh
RUN chmod +x /root/TF_install.sh
RUN /root/TF_install.sh
ENV PATH="/usr/local/bin/TEE-CLC-14.135.3:${PATH}"

COPY docker_install.sh /docker_install.sh
RUN chmod +x /docker_install.sh
RUN /docker_install.sh
RUN groupadd -f docker
RUN usermod -aG docker jenkins

USER jenkins
RUN pipx ensurepath
RUN pipx install semgrep