#!/bin/bash

echo "🚀 Ejecutando entorno de producción..."

echo "🧼 Deteniendo contenedor previo..."
docker compose down

echo "🐳 Levantando contenedor en modo producción..."
docker compose -f docker-compose.yml up -d

echo "⏳ Esperando 5 segundos para que el contenedor arranque..."
sleep 5

echo "🌐 Verificando acceso a http://localhost:8080/health..."
curl --silent http://localhost:8080/health || echo "❌ No se pudo conectar al endpoint /health"

echo "✅ Validación completa. Revisa los logs si necesitas más detalles:"
docker compose logs app

