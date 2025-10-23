# 🚀 Docker Compose con Go: Imágenes livianas, seguras y saludables para DevOps

Este workshop enseña cómo construir contenedores modernos usando Go y Docker Compose, con foco en seguridad, eficiencia y reproducibilidad. Usamos imágenes distroless, validación de salud (`HEALTHCHECK`), y automatización con scripts para garantizar un entorno robusto y didáctico.

---

## 🎯 Objetivos del workshop

- Construir una app en Go que responda en `/` y `/health`
- Generar una imagen Docker multi-stage con distroless
- Validar seguridad con `USER nonroot`
- Implementar `HEALTHCHECK` funcional y reproducible
- Automatizar el flujo con scripts
- Documentar cada paso como lección didáctica

---

## 📁 Estructura del repositorio

```
.
├── app/                      # Código fuente en Go
│   ├── main.go               # Servidor HTTP con endpoints /
│   └── go.mod                # Módulo Go
├── Dockerfile                # Build multi-stage + distroless
├── docker-compose.yml        # Ejecución declarativa
├── .gitignore                # Exclusión de binarios y logs
├── .dockerignore             # Exclusión de docs y scripts
├── README.md                 # Presentación del proyecto
├── README-GUIA.md            # Guía didáctica paso a paso
├── scripts/                  # Automatización y validación
│   ├── build-and-run.sh      # Construcción y ejecución
│   └── validar-healthcheck.sh # Verificación de estado
└── docs/
    └── estructura-del-workshop.md # Explicación de cada archivo
```

---

## 🚀 Cómo empezar

```bash
git clone https://github.com/tu-usuario/Docker-Compose-con-Go-imagenes-livianas-seguras-y-saludables-para-DevOps.git
cd Docker-Compose-con-Go-imagenes-livianas-seguras-y-saludables-para-DevOps
./scripts/build-and-run.sh
```

Luego visita: [http://localhost:8080](http://localhost:8080)

---

## ✅ Validación

```bash
./scripts/validar-healthcheck.sh
```

Deberías ver:

```
"Status": "healthy"
```

---

## 🧠 ¿Por qué Go?

Go permite compilar binarios autónomos, ideales para imágenes distroless. Esto elimina dependencias externas, mejora la seguridad, y simplifica el `Dockerfile`. Es el lenguaje perfecto para enseñar contenedores seguros y reproducibles.

---

## 📚 Recursos adicionales

- [README-GUIA.md](README-GUIA.md): guía paso a paso con explicaciones didácticas
- [docs/estructura-del-workshop.md](docs/estructura-del-workshop.md): explicación de cada archivo

