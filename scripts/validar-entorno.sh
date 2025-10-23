#!/bin/bash
echo "🔍 Verificando variable APP_ENV desde los logs del contenedor..."

CONTAINER_NAME=$(docker ps --format '{{.Names}}' | grep docker-compose-go-imageligeras-secure-helth-devops-app)

if [ -n "$CONTAINER_NAME" ]; then
  docker compose logs app | grep "🌍 Entorno activo:" || echo "⚠️ No se encontró la línea de entorno en los logs."
else
  echo "❌ No se encontró el contenedor del workshop."
fi

