# AWS 2-Tier Automated Deployment: Status Report

**Architecture:** React (Frontend) + Node.js (Backend) on a Single AWS EC2.

---

## 1. Accomplishments (What we have done)

We have successfully moved the project from a local folder to a cloud-ready environment.

* **Version Control:** Initialized Git and pushed the complete 2-tier codebase to GitHub.
* **CI/CD Pipeline:** Configured AWS CodePipeline and CodeBuild to trigger automatically on every `git push`.
* **Cloud Infrastructure:** Provisioned an AWS EC2 instance and manually verified the environment.
* **Process Management:** Successfully utilized **PM2** to manage the Node.js server and serve the static React production build.
* **Local Stability:** Verified that the app runs locally on Port 5000 (Backend) and Port 3000 (Frontend).

---

## 2. Current Technical Roadblocks

We are addressing three specific "handshake" issues to ensure full online functionality:

* **A. Entry Point Mapping:** Ensuring the PM2 `serve` command correctly maps to the `index.html` file inside the `frontend/build` folder.
* **B. Port Management:** Realigned Backend to Port 5000 and Frontend to Port 3000 to prevent collisions on the EC2 instance.
* **C. Network Connectivity:** Updating **Security Group** rules to allow Inbound TCP on Ports 3000 and 5000, and pointing the Frontend to the EC2's Public IP (`35.154.88.155`).

---

## 3. Action Plan (Next Steps)

1. **Port Realignment:** [COMPLETED] Backend on 5000, Frontend on 3000.
2. **Security Group Update:** Open Inbound TCP Ports 3000 and 5000 in the AWS Console.
3. **Dynamic IP Configuration:** Update React Frontend API calls to use the EC2 Public IP.
4. **Pipeline Automation:** Finalize `buildspec.yml` with AWS Systems Manager (SSM) for zero-SSH deployments.

---

## 4. Summary Status

* **Code:** 100% Complete.
* **Pipeline:** 90% Configured.
* **Deployment:** **In Progress** (Networking/Configuration Refinement).

---

## Technical Details

### Backend
- **Path:** `/var/www/my-app/backend`
- **Port:** 5000
- **Process:** PM2 `backend`

### Frontend
- **Path:** `/var/www/my-app/frontend`
- **Port:** 3000
- **Process:** PM2 `frontend`
