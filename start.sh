#!/bin/sh
# Arranque del contenedor: construye el índice vectorial si no existe y levanta el servidor.
set -e

if [ ! -d "data/vectorstore" ]; then
  echo "🧠 No existe la base vectorial. Construyéndola..."
  python src/ingest.py
fi

echo "🚀 Iniciando servidor de Cindy en el puerto 8000..."
exec uvicorn api:app --host 0.0.0.0 --port 8000 --app-dir src
