# 🔁 Reproducir el Workshop desde Cero

Esta guía ejecuta el workshop completo desde un entorno limpio, validando cada fase técnica y didáctica. Ideal para enseñanza, revisión técnica, CI/CD o portfolio.

---

## 🔁 Fase 0 — Reset total del entorno

```bash
./scripts/reset-workshop.sh
```

📂 Archivos: `scripts/reset-workshop.sh`  
🎯 Elimina contenedores, imágenes, redes, volúmenes y binario local `app/app`  
📚 “Partimos desde cero para evitar residuos y garantizar reproducibilidad. Este paso enseña limpieza controlada y buenas prácticas DevOps.”

---

## 📦 Fase 1 — Validar estructura y permisos

```bash
./scripts/validar-estructura.sh
```

📂 Archivos: `scripts/validar-estructura.sh`  
🎯 Verifica que todos los archivos clave estén presentes y que los scripts `.sh` tengan permisos de ejecución  
📚 “Evita errores silenciosos y modela rigor técnico. Enseña cómo preparar entornos reproducibles con control de estructura y permisos.”

---

## 🏗️ Fase 2 — Build de imagen segura

```bash
docker compose build
```

📂 Archivos: `Dockerfile`, `.dockerignore`, `app/main.go`, `app/go.mod`  
🎯 Compila el binario Go dentro de una imagen distroless con `USER nonroot`  
📚 “Enseña multi-stage builds, seguridad con distroless y cómo construir imágenes listas para producción.”

---

## 🧪 Fase 3 — Ejecutar entorno de desarrollo

```bash
./scripts/run-dev.sh
```

📂 Archivos: `scripts/run-dev.sh`, `docker-compose.override.yml`, `app/main.go`  
🎯 Compila el binario localmente con flags compatibles, levanta el contenedor en modo desarrollo (`APP_ENV=development`)  
📚 “Automatiza el flujo de desarrollo. Enseña compilación cruzada, montaje de volúmenes y validación de servicios en distroless.”

---

## ✅ Fase 4 — Validar salud del contenedor

```bash
./scripts/validar-healthcheck.sh
```

📂 Archivos: `scripts/validar-healthcheck.sh`, `main.go`  
🎯 Verifica que el contenedor esté en estado `healthy` según el `HEALTHCHECK` definido  
📚 “Enseña cómo Docker monitorea servicios y cómo validar salud en tiempo real.”

---

## 🌍 Fase 5 — Verificar entorno activo

```bash
docker compose logs app
```

📂 Archivos: `main.go`  
🎯 Confirma que `APP_ENV=development` fue propagado correctamente  
📚 “Enseña separación de entornos y cómo validar configuración desde los logs.”

---

## 🧠 Fase 6 — Validar variable APP_ENV desde logs

```bash
./scripts/validar-entorno.sh
```

📂 Archivos: `scripts/validar-entorno.sh`  
🎯 Extrae la variable `APP_ENV` desde los logs del contenedor  
📚 “En distroless no hay shell. Enseña cómo adaptar la observabilidad en entornos seguros y minimalistas.”

---

## 🔐 Fase 7 — Auditoría de seguridad con Trivy

```bash
trivy image secure-app:latest
```

📂 Imagen: `secure-app:latest`  
🎯 Verifica que no haya vulnerabilidades críticas en la imagen  
📚 “Enseña DevSecOps real: auditar antes de desplegar.”

---

## 🚀 Fase 8 — Ejecutar entorno de producción

```bash
./scripts/run-prod.sh
```

📂 Archivos: `scripts/run-prod.sh`, `docker-compose.yml`  
🎯 Levanta el contenedor sin override, usando la imagen distroless con `APP_ENV=production`  
📚 “Enseña despliegue seguro, sin dependencias locales ni montaje de volúmenes.”

---

## ✅ Fase 9 — Validar entorno de producción

```bash
./scripts/validar-prod.sh
```

📂 Archivos: `scripts/validar-prod.sh`  
🎯 Verifica que el contenedor responde correctamente en `http://localhost:8080/health` y que el entorno es `production`  
📚 “Enseña validación externa en distroless sin acceso shell. Ideal para monitoreo real.”

---

## 📄 Fase 10 — Documentación y cierre

📂 Archivos: `README-GUIA.md`, `docs/guia-detallada-del-workshop.md`, `docs/guia-instructor.md`  
🎯 Asegura que todo está explicado, reproducible y listo para enseñar  
📚 “Documentar cada fase convierte el workshop en una herramienta educativa y profesional.”

---

## 🔁 Fase 11 — Repetir el workshop (opcional)

```bash
./scripts/reset-workshop.sh
```

📚 “Repetir sin residuos demuestra dominio técnico y reproducibilidad total. Ideal para CI/CD, enseñanza o revisión técnica.”

---

✅ Workshop reproducido con éxito. Listo para enseñar, presentar o integrar en pipelines CI/CD.

