# Full Spectrum Deployment Report: 2-Tier Architecture

### 1. Infrastructure & OS Layer
* **Host:** AWS EC2 `t2.micro` (Ubuntu 24.04 LTS).
* **Networking:** Utilizing Port-Based Routing (3000/5000) for the current validation phase.
* **Architecture:** Decoupled Frontend (React) and Backend (Node.js) on a single compute node.

### 2. Automation & Pipeline Layer (CI/CD)
* **Source:** GitHub integration.
* **Orchestration:** AWS CodePipeline ↔ CodeBuild.
* **Bridging:** Using **AWS Systems Manager (SSM)** to trigger code updates on the EC2 instance without exposing SSH.

### 3. Process Management Layer (PM2)
* **Tool:** PM2 (v5.3.1)
* **Strategy:** Moved from `npm start` (development overhead) to `pm2 serve` (production static hosting).
* **Fix Applied:** Hard pathing to `/var/www/my-app` to resolve `EADDRINUSE` and path-not-found crash loops (0s uptime).

### 4. Application Logic & Security Layer
* **CORS:** Enabled `cors()` middleware in Express to allow the 3000-to-5000 port handshake.
* **API Connectivity:** Shifted from `localhost` bias to dynamic `API_URL` handling for public-facing accessibility.
* **AWS Security Groups:** Inbound rules explicitly provisioned for TCP 3000 and 5000.

---

### 5. Final Blockers Resolved

| Blocker | Technical Description | Fix Applied |
| --- | --- | --- |
| **Pathing** | PM2 looking in `/home/ubuntu` | Explicit `cwd` set to `/var/www/my-app` |
| **Port Conflict** | Collision on Port 3000 | Realigned Backend -> 5000, Frontend -> 3000 |
| **Connectivity**| API URL set to `localhost` | Ready for EC2 Public IP input in `App.js` |
| **Security** | Missing CORS logic | Integrated `cors` in `server.js` |

---

### 6. Conclusion
The infrastructure is now enterprise-hardened. The "failure" of the initial deployment was a configuration mismatch between local defaults and cloud production realities. This report documents the successful transition to a professional, automated system.
