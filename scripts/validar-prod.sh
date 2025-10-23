#!/bin/bash

echo "🔍 Validando entorno de producción..."

CONTAINER_NAME=$(docker ps --format '{{.Names}}' | grep docker-compose-go-imageligeras-secure-helth-devops-app)

if [ -n "$CONTAINER_NAME" ]; then
  echo "🌐 Verificando acceso a http://localhost:8080/health..."
  RESPONSE=$(curl --silent http://localhost:8080/health)

  if [[ "$RESPONSE" == *"status"* ]]; then
    echo "✅ Endpoint /health responde correctamente: $RESPONSE"
  else
    echo "❌ El endpoint /health no respondió como se esperaba."
  fi

  echo "📄 Verificando entorno desde los logs..."
  docker compose logs app | grep "🌍 Entorno activo:" || echo "⚠️ No se encontró la línea de entorno en los logs."
else
  echo "❌ No se encontró el contenedor del workshop en producción."
fi

