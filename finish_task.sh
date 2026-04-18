#!/bin/bash
SESSION_ID=$1

if [ -z "$SESSION_ID" ]; then
  echo "Usage: ./finish_task.sh <SESSION_ID>"
  exit 1
fi

echo "Waiting for Jules to complete session $SESSION_ID..."

while true; do
  # Vi kollar om raden för ID:t innehåller "Co" någonstans överhuvudtaget
  if jules remote list --session | grep "$SESSION_ID" | grep -q "Co"; then
    echo -e "\nTask completed! Fetching changes..."
    break
  fi
  
  echo -n "."
  sleep 5
done

jules remote pull --session "$SESSION_ID" --apply
git add .
git commit -m "Jules session $SESSION_ID completed"
git push origin HEAD
echo "Success! Everything is synced."
