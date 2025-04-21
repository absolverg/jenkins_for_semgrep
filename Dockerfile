FROM jenkins/jenkins:lts-jdk21

USER root
RUN apt-get update && apt-get install -y python3 python3-venv pipx

USER jenkins
RUN pipx ensurepath
RUN pipx install semgrep
