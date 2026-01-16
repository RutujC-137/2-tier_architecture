#!/bin/bash

# Navigate to backend directory
cd /var/www/my-app/backend

# Install dependencies
npm install

# Start or reload the application using PM2
pm2 reload pm2-backend.json || pm2 start pm2-backend.json

# Save PM2 list to ensure it persists on reboot if pm2 startup was configured
pm2 save
