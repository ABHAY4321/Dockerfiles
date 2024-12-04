FROM abhay10371/ubuntu_aio:latest
RUN apt-get update && apt-get install -y openssh-server
# Configure SSH
RUN mkdir -p /var/run/sshd
RUN echo 'root:redhat' | chpasswd
#password for user login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# Start SSH server
ENTRYPOINT service ssh start && /bin/bash
