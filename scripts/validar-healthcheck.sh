#!/bin/bash
echo "🔍 Verificando estado de salud del contenedor..."
CONTAINER_ID=$(docker ps --format '{{.ID}} {{.Names}}' | grep docker-compose-go-imageligeras-secure-helth-devops-app | awk '{print $1}')
if [ -n "$CONTAINER_ID" ]; then
  echo "✅ Estado de salud:"
  docker inspect "$CONTAINER_ID" | grep '"Status"'
else
  echo "❌ No se encontró el contenedor del workshop."
fi

