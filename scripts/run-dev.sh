#!/bin/bash

echo "🔧 Compilando binario Go en app/app (modo desarrollo compatible con distroless)..."
cd app
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ../app/app
cd ..

if [ ! -f "app/app" ]; then
  echo "❌ Error: El binario app/app no fue generado."
  exit 1
fi

echo "🧼 Deteniendo contenedor previo..."
docker compose down

echo "🐳 Levantando contenedor en modo desarrollo..."
docker compose up -d

echo "⏳ Esperando 5 segundos para que el contenedor arranque..."
sleep 5

echo "🌐 Verificando acceso a http://localhost:8081/health..."
curl --silent http://localhost:8081/health || echo "❌ No se pudo conectar al endpoint /health"

echo "✅ Validación completa. Revisa los logs si necesitas más detalles:"
docker compose logs app

