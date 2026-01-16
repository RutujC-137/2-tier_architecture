#!/bin/bash

# Navigate to frontend directory
cd /var/www/my-app/frontend

# Install dependencies (only needed if serve or scripts change)
npm install

# Build the frontend application
npm run build

# Start or reload the static server using PM2
pm2 reload pm2-frontend.json || pm2 start pm2-frontend.json

# Save PM2 list
pm2 save
