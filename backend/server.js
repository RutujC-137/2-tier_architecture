const express = require("express");
const cors = require("cors");
const app = express();
const path = require("path");

app.use(cors());


// Health check endpoint
app.get("/api/health", (req, res) => {
  res.json({
    status: "Backend running 🚀",
    timestamp: new Date().toISOString(),
    environment: process.env.NODE_ENV || "development"
  });
});

// Example API route
app.get("/api/info", (req, res) => {
  res.json({
    message: "Welcome to the 2-Tier AWS App API",
    features: ["Express.js", "PM2", "CodePipeline", "Single EC2 Deployment"]
  });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Backend running on port ${PORT}`);
});
