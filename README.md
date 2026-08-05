# Automatización con GenAI y CLI

Este proyecto es un entorno de ejecución contenedorizado optimizado para flujos de trabajo que integran el SDK de Google Generative AI con herramientas de línea de comandos estándar de la industria (Git, GitHub CLI, jq).

## Características Principales

- **Entorno Unificado:** Imagen ligera basada en Alpine con las herramientas necesarias preinstaladas.
- **Integración con GenAI:** SDK de Google Generative AI listo para usar globalmente.
- **Automatización de Git:** Soporte nativo para GitHub CLI y Git para automatizar repositorios.
- **Procesamiento de datos:** Incluye `jq` para manipular JSON de forma eficiente desde la terminal.
- **Despliegue Rápido:** Configuración lista para entornos CI/CD o desarrollo local mediante Docker.

## Guía de Inicio Rápido

### Requisitos previos
- Tener instalado [Docker](https://www.docker.com/).

### Construcción de la imagen
Para construir la imagen del proyecto, ejecuta en la raíz:

```bash
docker build -t genai-cli-tool .
```

### Ejecución del contenedor
Puedes iniciar un contenedor interactivo para empezar a trabajar:

```bash
docker run -it --rm genai-cli-tool /bin/bash
```

### Configuración de herramientas
Dentro del contenedor, asegúrate de configurar tus credenciales:

1. **GitHub CLI:**
   ```bash
   gh auth login
   ```
2. **Google GenAI:**
   Asegúrate de exportar tu API Key:
   ```bash
   export GOOGLE_API_KEY='tu_api_key_aqui'
   ```

## Soporte y Ayuda

Si encuentras algún problema o tienes dudas sobre el funcionamiento:
- Revisa el archivo `structure.txt` para entender la jerarquía del proyecto.
- Abre un **Issue** en el repositorio oficial proporcionando los logs y los pasos para reproducir el error.

## Mantenimiento y Contribución

¡Las contribuciones son bienvenidas! Para colaborar:

1. Realiza un **Fork** del repositorio.
2. Crea una rama para tu nueva funcionalidad (`git checkout -b feature/nueva-mejora`).
3. Realiza los cambios y documenta las actualizaciones en `changes.txt`.
4. Envía un **Pull Request** detallando tus modificaciones.

Mantente al tanto de las actualizaciones revisando periódicamente el archivo `changes.txt` incluido en la raíz.