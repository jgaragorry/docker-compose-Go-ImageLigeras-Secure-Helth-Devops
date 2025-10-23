#!/bin/bash

echo "🔍 Validando estructura del workshop..."

# Lista de archivos y carpetas esperados
ARCHIVOS=(
  "app/main.go"
  "app/go.mod"
  "Dockerfile"
  "docker-compose.yml"
  "docker-compose.override.yml"
  ".gitignore"
  ".dockerignore"
  "README.md"
  "README-GUIA.md"
  "docs/guia-detallada-del-workshop.md"
  "docs/guia-instructor.md"
  "scripts/build-and-run.sh"
  "scripts/validar-healthcheck.sh"
  "scripts/reset-workshop.sh"
  "scripts/validar-estructura.sh"
)

# Verificación
FALTANTES=0
for archivo in "${ARCHIVOS[@]}"; do
  if [ ! -e "$archivo" ]; then
    echo "❌ Falta: $archivo"
    FALTANTES=$((FALTANTES+1))
  else
    echo "✅ Presente: $archivo"
  fi
done

if [ "$FALTANTES" -eq 0 ]; then
  echo "🎉 Estructura completa y validada."
else
  echo "⚠️ Faltan $FALTANTES archivo(s). Revisa antes de continuar."
fi

