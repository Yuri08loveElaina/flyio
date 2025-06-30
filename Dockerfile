FROM ubuntu:22.04

# Cập nhật và cài openssh-server
RUN apt update && apt install -y openssh-server && \
    useradd -m htb && echo "htb:htb123" | chpasswd

# Cấu hình SSH daemon
RUN mkdir /var/run/sshd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Mở port 22
EXPOSE 22

# Khởi động SSH server
CMD ["/usr/sbin/sshd", "-D"]
