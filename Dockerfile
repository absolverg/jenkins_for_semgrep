FROM jenkins/jenkins:lts-jdk21

USER root
RUN apt-get update && apt-get install -y python3 pipx && \
    rm -rf /var/lib/apt/lists/*

USER jenkins

ENV PATH="/var/jenkins_home/.local/bin:${PATH}"

RUN pipx install semgrep
