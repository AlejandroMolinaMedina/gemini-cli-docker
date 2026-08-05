FROM node:20-alpine

# Instalar herramientas del sistema necesarias para git y automatizaciones
RUN apk add --update \
    git \
    bash \
    jq \
    curl

# Instalar el SDK/CLI globalmente
RUN npm install -g @google/genai

# Establecer directorio de trabajo por defecto
WORKDIR /github/workspace

ENTRYPOINT ["/bin/bash", "-c"]