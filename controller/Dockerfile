FROM fedora:38
LABEL maintainer="Og Maciel <omaciel@redhat.com>"

RUN yum check-update; \
    yum install -y gcc libffi-devel python3; \
    yum install -y git vim-enhanced jq; \
    yum install -y python3-pip; \
    yum install -y wget openssh-server openssh-clients; \
    yum clean all

RUN pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install ansible-lint requests yamllint; \
    python3 -m pip install ansible;

RUN mkdir -p /var/run/sshd
RUN ssh-keygen -A

WORKDIR /root
COPY id_ed25519* .ssh/
COPY inventory .
COPY ansible.cfg .
COPY config .ssh/

RUN chmod 0700 .ssh && chmod 0600 .ssh/*


ENTRYPOINT ["/usr/sbin/sshd", "-D"] 
