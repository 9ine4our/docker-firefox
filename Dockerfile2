FROM ubuntu:latest

# Install dependencies
RUN apt update && apt install -y \
    firefox \
    x11vnc \
    xvfb \
    fluxbox \
    && rm -rf /var/lib/apt/lists/*

# Buat user non-root untuk keamanan
RUN useradd -m dockeruser

# Set lingkungan tampilan X virtual
ENV DISPLAY=:1

# Script untuk menjalankan Xvfb, Fluxbox, dan Firefox
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose port VNC
EXPOSE 5800

# Perintah saat container dijalankan
CMD ["/start.sh"]
