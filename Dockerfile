FROM jenkins/jenkins:lts-jdk17

USER root
RUN apt-get update && apt-get install -y python3 pipx
COPY docker_install.sh /docker_install.sh
RUN chmod +x /docker_install.sh
RUN /docker_install.sh
COPY TF_install.sh /root/TF_install.sh
RUN chmod +x /root/TF_install.sh
RUN /root/TF_install.sh
ENV PATH="/usr/local/bin/TEE-CLC-14.139.0:${PATH}"
RUN tf eula -accept

RUN groupadd -f docker
RUN usermod -aG docker jenkins
RUN chmod 666 /var/run/docker.sock

USER jenkins
RUN pipx ensurepath
RUN pipx install semgrep