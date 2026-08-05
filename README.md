# Automatización de IA con Google GenAI y GitHub CLI

Este proyecto proporciona un entorno contenedorizado optimizado para la automatización de flujos de trabajo que integran la API de Google GenAI y GitHub CLI. Es ideal para desarrolladores que buscan ejecutar scripts de automatización, análisis de código o tareas de generación de contenido asistidas por IA de manera reproducible.

## Características Principales

*   **Entorno Ligero:** Basado en Alpine Linux para reducir el tamaño de la imagen y mejorar la seguridad.
*   **Herramientas Integradas:** Incluye `github-cli` (`gh`) para interactuar con repositorios y `@google/genai` (SDK de Google) para integrar capacidades de IA.
*   **Listo para Automatización:** Incluye `bash`, `jq` y `curl`, facilitando la manipulación de datos JSON y peticiones web dentro de tus scripts.
*   **Portabilidad:** Despliegue consistente en cualquier entorno que soporte Docker.

## Guía de Inicio Rápido

### Requisitos previos
* [Docker](https://www.docker.com/) instalado en tu sistema.

### Construcción de la imagen
Para construir el entorno, ejecuta el siguiente comando en la raíz del proyecto:

```bash
docker build -t genai-automation .
```

### Ejecución
Puedes ejecutar un contenedor interactivo para probar los comandos directamente:

```bash
docker run -it --rm genai-automation bash
```

Dentro del contenedor, puedes autenticarte con tus servicios:
1. **GitHub CLI:** Ejecuta `gh auth login`.
2. **Google GenAI:** Configura tu API Key según la documentación oficial del SDK `@google/genai`.

## Soporte y Ayuda

Si encuentras problemas o tienes preguntas:
* **Problemas:** Abre un nuevo [Issue](https://github.com/tu-usuario/tu-repo/issues) en el repositorio proporcionando detalles sobre el error y pasos para reproducirlo.
* **Documentación:** Consulta la [Documentación oficial de Google GenAI](https://ai.google.dev/) y la [Documentación de GitHub CLI](https://cli.github.com/).

## Mantenimiento y Contribución

Las contribuciones son bienvenidas para mejorar las capacidades de automatización o optimizar la imagen Docker.

### Cómo contribuir
1. Haz un **Fork** del repositorio.
2. Crea una **rama** para tu nueva funcionalidad (`git checkout -b feature/nueva-funcionalidad`).
3. Realiza tus **cambios** y confirma los mismos (`git commit -m 'feat: descripción breve'`).
4. **Push** a la rama (`git push origin feature/nueva-funcionalidad`).
5. Abre un **Pull Request**.

Este proyecto se mantiene bajo los principios de código abierto y agradecemos cualquier mejora en la configuración del `Dockerfile` o scripts auxiliares.