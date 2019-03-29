FROM mcr.microsoft.com/powershell

RUN apt-get update && apt-get install -y git
RUN git config --global user.email "you@example.com"

RUN echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
RUN echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config

RUN mkdir /home/git-sync
WORKDIR /home/git-sync

COPY ./git-sync.ps1 .

ENTRYPOINT ["pwsh", "git-sync.ps1"]