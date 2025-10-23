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

## 🧠 Paso 4.5 — Ejecutar entorno de desarrollo con script validado

```bash
./scripts/run-dev.sh
```

📂 Archivos: `scripts/run-dev.sh`, `app/app`, `docker-compose.override.yml`  
🎯 Compila el binario Go con flags compatibles (`GOOS=linux`, `GOARCH=amd64`, `CGO_ENABLED=0`), levanta el contenedor y valida el endpoint `/health`  
📚 “Este script automatiza el flujo de desarrollo, evitando errores de volumen y asegurando compatibilidad con imágenes distroless.”

✅ Validación esperada:

```
🌍 Entorno activo: development
{"status":"ok"}
```

---

## 🚀 Paso 5 — Ejecutar entorno de producción

```bash
./scripts/run-prod.sh
```

📂 Archivos: `scripts/run-prod.sh`, `docker-compose.yml`  
🎯 Levanta el contenedor sin override, usando la imagen distroless con `APP_ENV=production`  
📚 “Este paso valida el entorno de producción real, sin volúmenes ni compilación local. Ideal para enseñar despliegue seguro y reproducible.”

✅ Validación esperada:

```
🌍 Entorno activo: production
{"status":"ok"}
```

## ✅ Paso 5.1 — Validar entorno de producción

```bash
./scripts/validar-prod.sh
```

📂 Archivos: `scripts/validar-prod.sh`, `docker-compose.yml`  
🎯 Verifica que el contenedor esté corriendo en modo producción y que el endpoint `/health` responda correctamente  
📚 “Este paso confirma que el entorno de producción está activo y funcional. Validamos desde fuera del contenedor, ya que distroless no permite comandos internos.”

✅ Validación esperada:

```
🌍 Entorno activo: production
{"status":"ok"}
```


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
