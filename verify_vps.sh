#!/bin/bash

VPS_IP="195.201.90.99"
VPS_USER="user"
VPS_DIR="/opt/aifilemanager"

echo "=== Verifying VPS deployment ==="
echo "VPS: $VPS_USER@$VPS_IP:$VPS_DIR"

echo -e "\n[1/4] Checking remote directory structure..."
ssh $VPS_USER@$VPS_IP "ls -la $VPS_DIR"

echo -e "\n[2/4] Checking PM2 status for frontend..."
ssh $VPS_USER@$VPS_IP "pm2 list | grep aifilemanager-frontend"

echo -e "\n[3/4] Checking Docker containers status..."
ssh $VPS_USER@$VPS_IP "cd $VPS_DIR && docker-compose -f docker-compose.prod.yml ps"

echo -e "\n[4/4] Comparing key file checksums..."
files_to_check=(
  "frontend/package.json"
  "backend/requirements.txt"
  "docker-compose.prod.yml"
)

for file in "${files_to_check[@]}"; do
  echo -e "\nComparing $file:"
  local_hash=$(md5sum $file | awk '{print $1}')
  remote_hash=$(ssh $VPS_USER@$VPS_IP "md5sum $VPS_DIR/$file" | awk '{print $1}')
  
  echo "Local:  $local_hash"
  echo "Remote: $remote_hash"
  
  if [ "$local_hash" == "$remote_hash" ]; then
    echo "✅ Checksums match"
  else
    echo "❌ Checksums differ"
  fi
done

echo -e "\nVerification complete!"