# base image
FROM ubuntu
MAINTAINER shufo

# Install supervisord and openssh-server
RUN apt-get update -y -q
RUN apt-get install supervisor -y -q
ADD templates/sshd.conf /etc/supervisor/conf.d/sshd.conf
RUN apt-get install openssh-server -y
ADD ssh/id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/authorized_keys
RUN mkdir /var/run/sshd
RUN mkdir /var/log/ssh

# set root password to `root`
RUN echo "root" > /root/password
RUN bash -c 'echo "root:root" | chpasswd'

# expose default sshd port
EXPOSE 22

# run supervisord daemon
CMD ["/usr/bin/supervisord", "-n"]

