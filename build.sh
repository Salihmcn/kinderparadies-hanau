#!/bin/bash
# Dieses Script wird automatisch von Netlify ausgeführt.
# Es scannt den galerie/ Ordner und erstellt fotos.json

echo '[' > fotos.json
first=true

for file in galerie/*; do
  if [ -f "$file" ]; then
    lowercase=$(echo "$file" | tr '[:upper:]' '[:lower:]')
    case "$lowercase" in
      *.jpg|*.jpeg|*.png|*.webp)
        filename=$(basename "$file")
        if [ "$first" = true ]; then
          first=false
        else
          echo ',' >> fotos.json
        fi
        echo "  \"$filename\"" >> fotos.json
        ;;
    esac
  fi
done

echo ']' >> fotos.json

echo "fotos.json erstellt:"
cat fotos.json
