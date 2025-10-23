#!/bin/bash

echo "🧼 Iniciando limpieza completa del entorno del workshop..."

# Paso 1: Eliminar contenedor si existe
echo "🔍 Eliminando contenedores relacionados con el workshop..."
docker ps -a --format '{{.Names}}' | grep docker-compose-go-imageligeras-secure-helth-devops | xargs -r docker rm -f

# Paso 2: Eliminar imagen del workshop
echo "🧹 Eliminando imagen 'secure-app:latest' si existe..."
docker rmi -f secure-app:latest 2>/dev/null

# Paso 3: Eliminar volumen
echo "📦 Eliminando volumen 'app-data' si existe..."
docker volume rm app-data 2>/dev/null

# Paso 4: Eliminar red interna
echo "🌐 Eliminando red 'internal' si existe..."
docker network rm internal 2>/dev/null

# Paso 5: Prune de contenedores, imágenes, volúmenes y redes sin uso
echo "🧨 Eliminando contenedores detenidos..."
docker container prune -f
echo "🖼️ Eliminando imágenes sin uso..."
docker image prune -f
echo "📦 Eliminando volúmenes sin uso..."
docker volume prune -f
echo "🌐 Eliminando redes sin uso..."
docker network prune -f

# Paso 6: Prune completo del sistema
echo "🧯 Ejecutando 'docker system prune' para limpieza total..."
docker system prune -a -f --volumes

# Paso 7: Verificación final
echo "🔍 Verificando que no queden residuos..."

RESIDUOS=0

if docker ps -a | grep secure-app >/dev/null; then
  echo "❌ Contenedor 'secure-app' aún existe"
  RESIDUOS=$((RESIDUOS+1))
fi

if docker images | grep secure-app >/dev/null; then
  echo "❌ Imagen 'secure-app:latest' aún existe"
  RESIDUOS=$((RESIDUOS+1))
fi

if docker volume ls | grep app-data >/dev/null; then
  echo "❌ Volumen 'app-data' aún existe"
  RESIDUOS=$((RESIDUOS+1))
fi

if docker network ls | grep internal >/dev/null; then
  echo "❌ Red 'internal' aún existe"
  RESIDUOS=$((RESIDUOS+1))
fi

if [ "$RESIDUOS" -eq 0 ]; then
  echo "✅ Entorno completamente limpio. Puedes repetir el workshop sin conflictos."
else
  echo "⚠️ Quedan $RESIDUOS residuo(s). Revisa manualmente si es necesario."
fi

