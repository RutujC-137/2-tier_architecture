#!/bin/bash

# Define the app directory
APP_DIR="/var/www/my-app"

echo "🚀 Starting Unified Deployment..."

# 1. Sync Code
cd $APP_DIR
echo "📥 Pulling latest code..."
git pull origin main

# 2. Setup Backend
echo "⚙️ Setting up Backend..."
cd $APP_DIR/backend
npm install
# Hard reset to clear port collisions
pm2 delete backend || true

# 3. Setup Frontend
echo "⚙️ Setting up Frontend..."
cd $APP_DIR/frontend
npm install
npm run build
pm2 delete frontend || true

# 4. Launch Processes
echo "🚀 Launching processes with PM2..."
cd $APP_DIR/backend
pm2 start pm2-backend.json

cd $APP_DIR/frontend
pm2 start pm2-frontend.json

# 5. Persist
pm2 save
echo "✅ Deployment Successful!"
pm2 status
