FROM node:20-alpine

# Instalar herramientas del sistema necesarias para git y automatizaciones
RUN apk add --no-cache \
    git \
    bash \
    jq \
    curl \
    github-cli

# Instalar el SDK/CLI globalmente
RUN npm install -g @google/genai

# Permitir que Node encuentre módulos instalados de forma global (-g)
ENV NODE_PATH=/usr/local/lib/node_modules

# Establecer directorio de trabajo por defecto
WORKDIR /github/workspace

ENTRYPOINT ["/bin/bash", "-c"]