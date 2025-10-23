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
  "docs/estructura-del-workshop.md"
  "scripts/build-and-run.sh"
  "scripts/run-dev.sh"
  "scripts/run-prod.sh"
  "scripts/reset-workshop.sh"
  "scripts/validar-estructura.sh"
  "scripts/validar-healthcheck.sh"
  "scripts/validar-entorno.sh"
  "scripts/validar-prod.sh"
)

FALTANTES=0
SIN_PERMISOS=0

for archivo in "${ARCHIVOS[@]}"; do
  if [ ! -e "$archivo" ]; then
    echo "❌ Falta: $archivo"
    FALTANTES=$((FALTANTES+1))
  else
    echo "✅ Presente: $archivo"
    # Validar permisos de ejecución si es .sh
    if [[ "$archivo" == *.sh ]]; then
      if [ ! -x "$archivo" ]; then
        echo "⚠️ Sin permiso de ejecución: $archivo"
        SIN_PERMISOS=$((SIN_PERMISOS+1))
      else
        echo "✅ Permiso de ejecución: $archivo"
      fi
    fi
  fi
done

echo ""
if [ "$FALTANTES" -eq 0 ] && [ "$SIN_PERMISOS" -eq 0 ]; then
  echo "🎉 Estructura completa y permisos validados. Todo listo para ejecutar el workshop."
else
  echo "⚠️ Faltan $FALTANTES archivo(s) y $SIN_PERMISOS script(s) sin permiso de ejecución. Revisa antes de continuar."
fi

