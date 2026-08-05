# Proyecto de Automatización con IA Generativa

Una solución optimizada y lista para producción diseñada para integrar capacidades de IA Generativa de Google directamente en flujos de trabajo de automatización mediante un entorno basado en contenedores.

## Características Principales

*   **Entorno Preconfigurado:** Dockerfile optimizado basado en Alpine Linux con dependencias esenciales (git, bash, jq, curl).
*   **Integración CLI:** Incluye `github-cli` y `@google/genai` preinstalados para tareas de CI/CD y automatización de procesos.
*   **Ligero y Seguro:** Basado en Alpine para minimizar la superficie de ataque y reducir el tamaño de las imágenes.
*   **Listo para Pipelines:** Diseñado para ejecutarse en entornos de integración continua o como herramienta de línea de comandos.

## Guía de Inicio Rápido

### Requisitos previos
*   Docker instalado en tu máquina local.
*   Una API Key válida de Google Gemini.

### Construcción de la Imagen
```bash
docker build -t genai-automator .
```

### Ejecución
Puedes ejecutar un contenedor interactivo para probar los comandos:
```bash
docker run -it --rm \
  -e GOOGLE_API_KEY="tu_api_key_aqui" \
  genai-automator bash
```

Una vez dentro del contenedor, puedes invocar el SDK de Google Generative AI o interactuar con GitHub mediante `gh`.

## Estructura del Proyecto

```text
.
├── Dockerfile        # Definición del entorno y dependencias
├── changes.txt       # Registro de cambios recientes
└── structure.txt     # Esquema de la jerarquía del proyecto
```

## Soporte y Ayuda

Si encuentras algún problema o tienes dudas sobre la configuración:

1.  **Revisar Issues:** Consulta nuestra sección de [Issues](https://github.com/tu-usuario/tu-repo/issues) para ver si otros usuarios han reportado problemas similares.
2.  **Documentación:** Consulta la documentación oficial de [Google Generative AI SDK](https://github.com/google/generative-ai-js) para detalles sobre la API.
3.  **Reportar errores:** Si crees haber encontrado un error, abre un nuevo ticket incluyendo los logs de ejecución.

## Mantenimiento y Contribución

¡Las contribuciones son bienvenidas! Para mantener la calidad del proyecto, sigue estos pasos:

1.  Haz un **Fork** del repositorio.
2.  Crea una rama para tu nueva funcionalidad (`git checkout -b feature/nueva-mejora`).
3.  Realiza tus cambios y asegúrate de actualizar el `Dockerfile` si añades nuevas dependencias.
4.  Envía un **Pull Request** detallando los cambios realizados.

Este proyecto es mantenido por la comunidad. Por favor, asegúrate de actualizar el archivo `changes.txt` al enviar una contribución significativa.