FROM jenkins/jenkins:lts-jdk17

USER root
RUN apt-get update && apt-get install -y python3 pipx

USER jenkins
RUN pipx ensurepath
RUN pipx install semgrep
