FROM amazonlinux:latest

RUN yum update -y \
  && yum install systemd -y \
  && yum install openssh-server -y \
  && yum install -y vim

RUN ssh-keygen -A

# SSH接続用の設定
RUN sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
  && sed -i 's/#PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config \
  && sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config

RUN chmod 700 /root/.ssh \
  && touch /root/.ssh/authorized_keys \
  && chmod 600 /root/.ssh/authorized_keys

CMD ["/sbin/init"]