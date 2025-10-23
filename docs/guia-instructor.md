# 🧠 Guía del Instructor — Ejecución completa del workshop

Este documento guía al instructor o revisor técnico para ejecutar el workshop paso a paso, validando cada fase con comandos, archivos involucrados y objetivos didácticos. Incluye las últimas correcciones aplicadas, como la validación del entorno activo (`APP_ENV`) y la auditoría de seguridad.

---

## 🔁 Paso 1 — Reset total del entorno

```bash
./scripts/reset-workshop.sh
```

📂 Archivos: `scripts/reset-workshop.sh`  
🎯 Elimina contenedores, imágenes, redes y volúmenes previos  
📚 “Partimos desde un entorno limpio para evitar conflictos y garantizar reproducibilidad.”

---

## 📦 Paso 2 — Validar estructura del repositorio

```bash
./scripts/validar-estructura.sh
```

📂 Archivos: `scripts/validar-estructura.sh`  
🎯 Verifica que todos los archivos necesarios estén presentes, incluyendo `docker-compose.override.yml`  
📚 “Validar estructura evita errores y modela buenas prácticas de preparación técnica.”

---

## 🏗️ Paso 3 — Construir imagen segura con Dockerfile

```bash
docker compose build
```

📂 Archivos: `Dockerfile`, `.dockerignore`, `app/main.go`, `app/go.mod`  
🎯 Compila el binario Go en una imagen distroless con `USER nonroot`  
📚 “Usamos multi-stage y distroless para seguridad, tamaño reducido y producción real.”

---

## 🐳 Paso 4 — Levantar el contenedor con Docker Compose

### 🔧 Para desarrollo (con override):

```bash
docker compose up -d
```

✅ Usa `docker-compose.yml` + `docker-compose.override.yml`  
📚 “En desarrollo montamos el código, usamos puerto 8081 y activamos `APP_ENV=development`.”

---

### 🔐 Para producción (sin override):

```bash
docker compose -f docker-compose.yml up -d
```

✅ Usa solo `docker-compose.yml`  
📚 “En producción usamos imagen distroless, sin volumen montado, y `APP_ENV=production`.”

---

## 🧪 Paso 5 — Validar salud del contenedor

```bash
./scripts/validar-healthcheck.sh
```

📂 Archivos: `scripts/validar-healthcheck.sh`, `main.go`  
🎯 Verifica que el contenedor esté `healthy` y que el endpoint `/health` responda correctamente  
📚 “Docker monitorea servicios con `HEALTHCHECK`, y nosotros lo validamos manualmente.”

---

## 🌍 Paso 6 — Verificar entorno activo

```bash
docker compose logs app
```

✅ Log esperado:

```
🌍 Entorno activo: development
```

📚 “Separar entornos permite adaptar el stack sin duplicar código. Validamos con logs y variables de entorno.”

---

## 🧠 Paso 7 — Validar propagación de APP_ENV

```bash
./scripts/validar-entorno.sh
```

📂 Archivos: `scripts/validar-entorno.sh`  
🎯 Verifica que la variable `APP_ENV` esté definida dentro del contenedor  
📚 “Las variables de entorno permiten adaptar el comportamiento de una app sin cambiar el código. Validarlas enseña cómo Docker Compose gestiona configuración en tiempo de ejecución.”

---

## 🔐 Paso 8 — Auditoría de seguridad con Trivy

```bash
trivy image secure-app:latest
```

📂 Imagen: `secure-app:latest`  
🎯 Verifica que no haya vulnerabilidades críticas  
📚 “Auditar imágenes antes de desplegar es parte esencial de
