FROM mcr.microsoft.com/powershell

RUN apt-get update && apt-get install -y git

RUN echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
RUN echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config

RUN mkdir /home/git-sync
WORKDIR /home/git-sync

COPY ./auto-push.ps1 .

ENTRYPOINT ["pwsh", "auto-push.ps1"]