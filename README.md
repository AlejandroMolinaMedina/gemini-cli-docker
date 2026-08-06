# Gemini CLI Docker Environment

![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

Este repositorio contiene la definición del contenedor Docker optimizado que actúa como entorno de ejecución (runner) para la GitHub Action `Alexmm14/toolsActions/gemini-readme`.

La imagen empaqueta las dependencias necesarias, incluyendo la GitHub CLI (`gh`) y utilidades del sistema, para permitir que los flujos de trabajo de CI/CD analicen repositorios, extraigan metadatos y gestionen ramas o Pull Requests de forma automatizada mediante Gemini.

## Características Principales

*   **Entorno Pre-configurado:** Incluye `gh` (GitHub CLI), `git`, `curl` y `jq` para operaciones de automatización.
*   **Optimización para CI/CD:** Imagen ligera diseñada específicamente para ejecutarse dentro de la directiva `container:` en GitHub Actions.
*   **Automatización IA:** Diseñada para trabajar en conjunto con la acción `gemini-readme` para la generación y actualización dinámica de documentación.
*   **Despliegue Listo:** Publicada en el GitHub Container Registry (GHCR) para una integración rápida.

## Estructura del Proyecto

```text
.
├── Dockerfile          # Definición de la imagen (gh + herramientas base)
├── README.md           # Documentación del proyecto
├── changes.txt         # Artefacto auxiliar: historial de commits recientes
└── structure.txt       # Artefacto auxiliar: jerarquía del árbol de directorios
```

## Guía de Uso en GitHub Actions

Para utilizar este contenedor en tus flujos de trabajo, especifica la imagen desde el GHCR en tu archivo `.github/workflows/workflow.yaml`:

```yaml
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
      
      - name: Auto Update README
        uses: Alexmm14/toolsActions/gemini-readme@master
        with:
          gemini_api_key: ${{ secrets.GEMINI_API_KEY }}
          gemini_model: 'gemini-1.5-flash'
```

## Desarrollo y Construcción Local

### Requisitos previos
*   Tener [Docker](https://docs.docker.com/get-docker/) instalado.

### Comandos útiles
1. **Construir la imagen localmente:**
   ```bash
   docker build -t gemini-cli-docker .
   ```
2. **Validar instalación de herramientas:**
   ```bash
   docker run --rm -it gemini-cli-docker gh --version
   ```

### Publicación en GHCR
Para subir una nueva versión al registro, asegúrate de estar autenticado y ejecuta:
```bash
echo $CR_PAT | docker login ghcr.io -u alejandromolinamedina --password-stdin
docker build -t ghcr.io/alejandromolinamedina/gemini-cli-docker:latest .
docker push ghcr.io/alejandromolinamedina/gemini-cli-docker:latest
```

## Soporte
Para reportar errores o solicitar nuevas funcionalidades, por favor abre un [Issue](https://github.com/alejandromolinamedina/gemini-cli-docker/issues) en este repositorio.

## Contribución
Las contribuciones son bienvenidas. Si deseas mejorar el entorno o añadir nuevas herramientas de CLI, por favor realiza un *fork* del repositorio y envía un *Pull Request*.