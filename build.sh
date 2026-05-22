#!/bin/bash
# Dieses Script wird automatisch von Netlify ausgeführt.
# Es scannt den galerie/ Ordner und erstellt fotos.json

echo '['> fotos.json
first=true
for file in galerie/*.{jpg,jpeg,png,JPG,JPEG,PNG,webp,WEBP}; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    if [ "$first" = true ]; then
      first=false
    else
      echo ',' >> fotos.json
    fi
    echo "  \"$filename\"" >> fotos.json
  fi
done
echo ']' >> fotos.json

echo "fotos.json erstellt mit folgenden Bildern:"
cat fotos.json
