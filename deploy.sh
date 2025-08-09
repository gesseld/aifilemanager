#!/bin/bash

VPS_IP="195.201.90.99"
VPS_USER="user"
VPS_DIR="/opt/aifilemanager"

# Transfer files
echo "Transferring files to VPS..."
scp -r ./* $VPS_USER@$VPS_IP:$VPS_DIR || {
    echo "File transfer failed"
    exit 1
}

# Execute deployment commands
echo "Starting deployment on VPS..."
ssh $VPS_USER@$VPS_IP << 'EOF'
    cd /opt/aifilemanager
    
    # Install dependencies and run frontend via PM2
    cd frontend
    yarn install
    pm2 delete aifilemanager-frontend || true
    pm2 start "yarn dev --host" --name aifilemanager-frontend
    
    # Start backend Docker containers
    cd ..
    docker-compose -f docker-compose.prod.yml up -d --build
    
    # Cleanup deploy script
    rm -f deploy.sh
EOF

echo "Deployment complete!"
echo "Frontend: http://$VPS_IP:3000 (running via PM2)"
echo "Backend API: http://$VPS_IP:8000"
echo "Use 'pm2 logs aifilemanager-frontend' on VPS to view frontend logs"