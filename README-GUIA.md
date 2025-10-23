# 🧠 Guía Didáctica del Workshop

Este workshop enseña cómo construir contenedores seguros, livianos y saludables usando Go, Docker Compose e imágenes distroless. Cada fase está diseñada para ser reproducible, validable y didáctica, ideal para enseñanza, portfolio técnico y CI/CD.

---

## ✅ Fases del Workshop

1. **Reset completo del entorno**
2. **Validación de estructura del repositorio**
3. **Build multi-stage con Go**
4. **Imagen final distroless**
5. **`HEALTHCHECK` funcional**
6. **Separación de entornos (producción vs desarrollo)**
7. **Validación de entorno activo (`APP_ENV`)**
8. **Auditoría de seguridad con Trivy**
9. **Documentación y cierre**
10. **Repetición opcional del workshop**

---

## 🔁 Fase 0 — Reset total del entorno

```bash
./scripts/reset-workshop.sh
```

📂 Archivos: `scripts/reset-workshop.sh`  
🎯 Elimina contenedores, imágenes, redes y volúmenes previos  
📚 “Partimos desde un entorno limpio para evitar conflictos y garantizar reproducibilidad.”

---

## 📦 Fase 1 — Validar estructura del repositorio

```bash
./scripts/validar-estructura.sh
```

📂 Archivos: `scripts/validar-estructura.sh`  
🎯 Verifica que todos los archivos estén presentes, incluyendo `docker-compose.override.yml`  
📚 “Validar estructura evita errores y modela buenas prácticas de preparación técnica.”

---

## 🏗️ Fase 2 — Construir imagen segura con Dockerfile

```bash
docker compose build
```

📂 Archivos: `Dockerfile`, `.dockerignore`, `app/main.go`, `app/go.mod`  
🎯 Compila el binario Go en una imagen distroless con `USER nonroot`  
📚 “Usamos multi-stage y distroless para seguridad, tamaño reducido y producción real.”

---

## 🐳 Fase 3 — Levantar el contenedor con Docker Compose

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

## 🧪 Fase 4 — Validar salud del contenedor

```bash
./scripts/validar-healthcheck.sh
```

📂 Archivos: `scripts/validar-healthcheck.sh`, `main.go`  
🎯 Verifica que el contenedor esté `healthy` y que el endpoint `/health` responda correctamente  
📚 “Docker monitorea servicios con `HEALTHCHECK`, y nosotros lo validamos manualmente.”

---

## 🌍 Fase 5 — Verificar entorno activo

```bash
docker compose logs app
```

✅ Log esperado:

```
🌍 Entorno activo: development
```

📚 “Separar entornos permite adaptar el stack sin duplicar código. Validamos con logs y variables de entorno.”

---

## 🧠 Fase 6 — Validar propagación de APP_ENV

```bash
./scripts/validar-entorno.sh
```

📂 Archivos: `scripts/validar-entorno.sh`  
🎯 Verifica que la variable `APP_ENV` esté definida dentro del contenedor  
📚 “Las variables de entorno permiten adaptar el comportamiento de una app sin cambiar el código. Validarlas enseña cómo Docker Compose gestiona configuración en tiempo de ejecución.”

---

## 🔐 Fase 7 — Auditoría de seguridad con Trivy

```bash
trivy image secure-app:latest
```

📂 Imagen: `secure-app:latest`  
🎯 Verifica que no haya vulnerabilidades críticas  
📚 “Auditar imágenes antes de desplegar es parte esencial de DevSecOps.”

---

## 📄 Fase 8 — Documentación y cierre

📂 Archivos: `README-GUIA.md`, `docs/guia-detallada-del-workshop.md`  
🎯 Asegura que todo está explicado, reproducible y listo para enseñar  
📚 “Documentar cada fase convierte el workshop en una herramienta educativa y profesional.”

---

## 🔁 Fase 9 — Repetir el workshop (opcional)

```bash
./scripts/reset-workshop.sh
```

📚 “Repetir el workshop sin residuos demuestra dominio técnico y reproducibilidad total.”

---

## ✅ Validación final

| Fase | Acción | Resultado esperado |
|------|--------|--------------------|
| 0 | Reset | Entorno limpio |
| 1 | Validar estructura | Archivos presentes |
| 2 | Build | Imagen creada |
| 3 | Up | Contenedor iniciado |
| 4 | Healthcheck | Estado `healthy` |
| 5 | Logs | Entorno activo detectado |
| 6 | APP_ENV | Variable propagada correctamente |
| 7 | Trivy | 0 vulnerabilidades críticas |
| 8 | Documentación | Todo explicado y reproducible |

---

✅ Workshop validado, reproducible y listo para enseñar, presentar o integrar en pipelines CI/CD.

