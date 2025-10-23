# 📘 Guía Detallada del Workshop

Este documento acompaña al `README-GUIA.md` y explica en profundidad cada fase del workshop, su propósito técnico, su valor didáctico y cómo se valida su correcta ejecución.

---

## 🔁 Fase 0 — Reset completo del entorno

**Script:** `scripts/reset-workshop.sh`

- Elimina contenedores, imágenes, redes y volúmenes relacionados con el workshop
- Ejecuta `docker system prune` para limpieza total
- Verifica que no queden residuos

📚 *Lección:* “Partir desde un entorno limpio garantiza reproducibilidad y evita conflictos comunes en entornos Docker.”

---

## 📦 Fase 1 — Validación de estructura

**Script:** `scripts/validar-estructura.sh`

- Verifica la presencia de todos los archivos clave:
  - Código fuente (`app/`)
  - Configuración (`Dockerfile`, `docker-compose.yml`, `docker-compose.override.yml`)
  - Scripts (`scripts/*.sh`)
  - Documentación (`README.md`, `README-GUIA.md`, `docs/`)

📚 *Lección:* “Validar la estructura antes de ejecutar evita errores y modela buenas prácticas de preparación técnica.”

---

## 🏗️ Fase 2 — Construcción de imagen segura

**Comando:**

```bash
docker compose build
```

- Usa multi-stage build con Go
- Genera una imagen distroless con `USER nonroot`
- Tamaño final: ~9MB

📚 *Lección:* “Multi-stage + distroless = imágenes más seguras, pequeñas y listas para producción.”

---

## 🐳 Fase 3 — Ejecución del contenedor

**Comando:**

```bash
docker compose up -d
```

- Levanta el contenedor con:
  - Red interna
  - Volumen `:ro`
  - `read_only: true`
  - `no-new-privileges: true`

📚 *Lección:* “La seguridad no solo está en la imagen, también en cómo se ejecuta el contenedor.”

---

## 🧪 Fase 4 — Validación de salud

**Script:** `scripts/validar-healthcheck.sh`

- Ejecuta el binario con `-health`
- Verifica que el contenedor esté en estado `healthy`
- Usa `docker inspect` para confirmar

📚 *Lección:* “Docker permite monitorear servicios con `HEALTHCHECK`. Validarlo manualmente enseña cómo funciona.”

---

## 🌍 Fase 5 — Separación de entornos

**Desarrollo:**

```bash
docker compose up -d
docker compose logs app
```

✅ Log esperado:

```
🌍 Entorno activo: development
```

**Producción:**

```bash
docker compose -f docker-compose.yml up -d
```

📚 *Lección:* “Separar entornos con override permite adaptar el stack sin duplicar código. Validar con logs refuerza buenas prácticas.”

---

## 🔐 Fase 6 — Auditoría de seguridad

**Comando:**

```bash
trivy image secure-app:latest
```

- Resultado: 0 vulnerabilidades críticas
- 11 vulnerabilidades detectadas en el binario Go (documentadas)

📚 *Lección:* “Auditar imágenes antes de desplegar es parte esencial de DevSecOps. Trivy permite enseñar esto con ejemplos reales.”

---

## 📄 Fase 7 — Documentación y cierre

- Todos los pasos están explicados en `README-GUIA.md` y esta guía
- Scripts validados y reproducibles
- Logs y resultados confirmados

📚 *Lección:* “Documentar cada fase convierte el workshop en una herramienta educativa, profesional y reutilizable.”

---

## 🔁 Fase 8 — Repetición del workshop

**Comando:**

```bash
./scripts/reset-workshop.sh
```

📚 *Lección:* “Repetir el workshop sin residuos demuestra dominio técnico y reproducibilidad total.”

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
| 6 | Trivy | 0 vulnerabilidades críticas |
| 7 | Documentación | Todo explicado y reproducible |

---

## 🎯 Conclusión

Este workshop demuestra cómo construir un stack seguro, reproducible y didáctico con Go y Docker Compose. Cada fase está validada, documentada y lista para ser enseñada o presentada profesionalmente.


