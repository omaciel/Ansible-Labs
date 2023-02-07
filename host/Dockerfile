FROM fedora:38
LABEL maintainer="Og Maciel <omaciel@redhat.com>"

RUN yum install -y \
    unzip \
    openssh-server \
    curl ; \
    yum clean all

RUN mkdir -p /var/run/sshd

# Setup the default user.
RUN useradd -rm -d /home/labuser -s /bin/bash -g root -G wheel labuser
RUN echo 'labuser:labuser' | chpasswd
COPY --chown=labuser:labuser id_ed25519.pub /home/labuser/.ssh/authorized_keys
COPY labuser /etc/sudoers.d/

RUN ssh-keygen -A
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
