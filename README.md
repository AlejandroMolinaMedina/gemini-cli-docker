# Gemini CLI Docker Environment

Este repositorio contiene la definición del contenedor Docker utilizado como entorno de ejecución (runner) para la GitHub Action Alexmm14/toolsActions/gemini-readme.

La imagen empaqueta la CLI de GitHub (gh) y las utilidades del sistema necesarias para analizar repositorios, extraer metadatos contextuales y permitir a la acción de Gemini crear ramas y Pull Requests automáticamente.

## Contenido y Herramientas Incluidas

| Herramienta / Componente | Descripción y Uso |
| :--- | :--- |
| gh (GitHub CLI) | Requerido. Utilizado por la acción para autenticarse, crear ramas y abrir automáticamente el Pull Request con los cambios de la documentación. |
| git / curl / jq | Herramientas de soporte para la extracción del árbol de directorios, historial de cambios y descarga del prompt remoto. |
| Base Image | Entorno optimizado para ejecutarse dentro de la directiva container: de GitHub Actions. |

## Estructura del Repositorio

.
├── Dockerfile          # Definición de la imagen del contenedor con gh y herramientas
├── changes.txt         # Artefacto auxiliar con el historial de commits recientes (usado por Gemini)
└── structure.txt       # Artefacto auxiliar con la jerarquía del árbol del proyecto (usado por Gemini)

## Uso en GitHub Actions

Esta imagen se publica en GitHub Container Registry (GHCR) y está diseñada para usarse como contenedor base en tus workflows de CI/CD:

```yaml
name: Auto Update README

on:
  push:
    branches: [ main, master ]

jobs:
  update-readme:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/alejandromolinamedina/gemini-cli-docker:latest
      credentials:
        username: ${{ github.actor }}
        password: ${{ secrets.GITHUB_TOKEN }}
    steps:
      - name: Checkout del repositorio
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Auto Update README via Gemini
        uses: Alexmm14/toolsActions/gemini-readme@master
        with:
          gemini_api_key: ${{ secrets.GEMINI_API_KEY }}
          gemini_model: 'gemini-1.5-flash'
          prompt_url: '[https://raw.githubusercontent.com/usuario/repo/main/prompts/readme-updater.md](https://raw.githubusercontent.com/usuario/repo/main/prompts/readme-updater.md)'
Construcción Local y Pruebas
Si deseas construir la imagen localmente o probar las herramientas en tu equipo:

1. Construir la imagen
docker build -t gemini-cli-docker .

2. Probar que GitHub CLI esté disponible
docker run --rm -it -e GITHUB_TOKEN="tu_personal_access_token" gemini-cli-docker gh --version

Publicación en GHCR (GitHub Container Registry)
Para compilar y subir una nueva versión del contenedor a GHCR manualmente:

Autenticarse en GHCR
echo $CR_PAT | docker login ghcr.io -u alejandromolinamedina --password-stdin

Construir y etiquetar
docker build -t ghcr.io/alejandromolinamedina/gemini-cli-docker:latest .

Publicar imagen
docker push ghcr.io/alejandromolinamedina/gemini-cli-docker:latest