#!/bin/bash
echo "🚀 Construyendo imagen..."
docker build -t secure-app:latest .

echo "🧼 Eliminando contenedor previo..."
docker rm -f secure-app 2>/dev/null

echo "🏃 Ejecutando contenedor..."
docker run -d --name secure-app -p 8080:8080 secure-app:latest

echo "⏳ Esperando 20s para verificar salud..."
sleep 20
./scripts/validar-healthcheck.sh

