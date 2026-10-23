FROM lscr.io/linuxserver/code-server:latest

USER root

# Instalar Python, pip, venv, Git, Node.js y sudo
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    sudo \
    curl \
    ca-certificates && \
    curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Permitir sudo al usuario habitual de code-server
RUN if id abc >/dev/null 2>&1; then \
      echo "abc ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/abc && \
      chmod 0440 /etc/sudoers.d/abc; \
    fi

ENV DEFAULT_WORKSPACE=/config/workspace

EXPOSE 8443
