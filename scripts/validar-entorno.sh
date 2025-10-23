#!/bin/bash
echo "🔍 Verificando variable APP_ENV dentro del contenedor..."

CONTAINER_ID=$(docker ps --format '{{.ID}} {{.Names}}' | grep docker-compose-go-imageligeras-secure-helth-devops-app | awk '{print $1}')

if [ -n "$CONTAINER_ID" ]; then
  ENV_VALUE=$(docker exec "$CONTAINER_ID" printenv APP_ENV)
  if [ -n "$ENV_VALUE" ]; then
    echo "✅ APP_ENV está definido como: $ENV_VALUE"
  else
    echo "⚠️ APP_ENV no está definido dentro del contenedor."
  fi
else
  echo "❌ No se encontró el contenedor del workshop."
fi

