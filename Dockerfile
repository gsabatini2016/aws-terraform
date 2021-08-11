FROM debian:stable-slim

COPY bin/unzip /usr/bin/

WORKDIR /tmp/
ADD https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip awscli-exe-linux-x86_64.zip
ADD https://releases.hashicorp.com/terraform/1.0.2/terraform_1.0.2_linux_amd64.zip terraform_1.0.2_linux_amd64.zip
ADD bin/curl /usr/bin/curl

RUN unzip awscli-exe-linux-x86_64.zip
RUN ./aws/install
RUN unzip terraform_1.0.2_linux_amd64.zip
RUN mv terraform /usr/bin/
RUN rm -r /tmp/* /usr/bin/unzip
