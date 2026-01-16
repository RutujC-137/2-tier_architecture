#!/bin/bash

# Define the app directory
APP_DIR="/var/www/my-app"

echo "🚀 Starting Unified Ubuntu Deployment..."

# 1. Sync Code
cd $APP_DIR
echo "📥 Pulling latest code..."
git pull origin main

# 2. Cleanup existing port locks
echo "🧹 Clearing port 3000 and 5000..."
sudo fuser -k 3000/tcp || true
sudo fuser -k 5000/tcp || true

# 3. Setup Backend
echo "⚙️ Setting up Backend..."
cd $APP_DIR/backend
npm install
pm2 delete backend || true

# 4. Setup Frontend
echo "⚙️ Setting up Frontend..."
cd $APP_DIR/frontend
npm install
npm run build
pm2 delete frontend || true

# 5. Launch Processes
echo "🚀 Launching processes..."
cd $APP_DIR/backend
pm2 start pm2-backend.json --name "backend"

cd $APP_DIR/frontend
pm2 start "serve -s build -l 3000" --name "frontend"

# 6. Finalize
pm2 save
echo "✅ Deployment Successful on Ubuntu!"
pm2 status
