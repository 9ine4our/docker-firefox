FROM ubuntu:latest

# Install dependencies dengan opsi tambahan
RUN apt update && apt install -y \
    firefox \
    x11vnc \
    xvfb \
    fluxbox \
    net-tools \
    x11-utils \
    && rm -rf /var/lib/apt/lists/*


# Buat direktori kerja
WORKDIR /root

# Konfigurasi VNC Server
RUN mkdir -p ~/.vnc && \
    echo "password" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd

# Start Xvfb dan VNC saat container berjalan
CMD Xvfb :0 -screen 0 1024x768x16 & \
    fluxbox & \
    x11vnc -display :0 -forever -passwd password
