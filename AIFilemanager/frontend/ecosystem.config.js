module.exports = {
  apps: [{
    name: "aifilemanager-frontend",
    script: "yarn",
    args: "vite preview --port 3000 --host 0.0.0.0",
    cwd: "./frontend",
    interpreter: "/usr/bin/node",
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: "1G",
    env: {
      NODE_ENV: "production",
      PORT: 3000
    }
  }]
}
