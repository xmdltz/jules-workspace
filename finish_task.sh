#!/bin/bash

# 1. En loop som kör 'jules remote list --session' och väntar tills status är 'Co'
echo "Waiting for session status 'Co'..."
while ! jules remote list --session | grep -q "Co"; do
  sleep 5
done

# 2. Sen kör den 'jules remote pull --apply'
echo "Pulling changes..."
jules remote pull --apply

# 3. Sen kör den git add, commit och 'git push origin HEAD'
echo "Staging, committing and pushing..."
git add .
git commit -m "Finish task"
git push origin HEAD
