# AWS 2-Tier Single EC2 Web Application

This project is a boilerplate for deploying a 2-tier application (Node.js backend + React frontend) on a single AWS EC2 instance using PM2.

## Project Structure

```
aws-2tier-single-ec2/
│
├── frontend/           # React application
│   ├── pm2-frontend.json
│   └── ...
│
├── backend/            # Express.js API
│   ├── pm2-backend.json
│   └── ...
│
├── scripts/            # Deployment scripts for EC2
│   ├── frontend-deploy.sh
│   └── backend-deploy.sh
│
├── buildspec-frontend.yml  # AWS CodeBuild spec for Frontend
├── buildspec-backend.yml   # AWS CodeBuild spec for Backend
└── README.md
```

## How to Deploy (EC2 Steps)

1. **Setup EC2 (Amazon Linux 2)**
   - Open ports 22, 80, 3000, 8080.
   - Install Node.js & PM2.

2. **Clone the Repo**
   - Push this code to your GitHub.
   - Clone to `/home/ec2-user/app` on EC2.

3. **PM2 Setup**
   ```bash
   pm2 startup
   # Run the command provided by pm2 startup
   pm2 save
   ```

4. **CodePipeline**
   - Set up two pipelines (one for frontend, one for backend).
   - Use the respective `buildspec-*.yml` files.

## Traffic Flow
- **Port 80 (Nginx)**: Proxy to 8080 (Frontend) and 3000 (Backend /api).
- **Port 8080**: Frontend (PM2)
- **Port 3000**: Backend (PM2)
