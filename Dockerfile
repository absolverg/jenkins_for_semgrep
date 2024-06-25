FROM jenkins/jenkins:lts-jdk17

USER root
RUN apt-get update && apt-get install -y python3 pipx
COPY TF_install.sh /root/TF_install.sh
RUN chmod +x /root/TF_install.sh
RUN /root/TF_install.sh
ENV PATH="/usr/local/bin/TEE-CLC-14.135.3:${PATH}"
RUN tf eula -accept

USER jenkins
RUN pipx ensurepath
RUN pipx install semgrep