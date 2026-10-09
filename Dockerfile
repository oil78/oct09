# Use official lightweight Node.js image
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Create a minimal HTTP server
RUN echo 'const http = require("http"); \
const server = http.createServer((req, res) => { \
  res.writeHead(200, {"Content-Type": "text/plain"}); \
  res.end("Hello from Cloud Run via GitHub Actions & Workload Identity!\n"); \
}); \
server.listen(8080, () => console.log("Server running on port 8080"));' > server.js

# Expose container port
EXPOSE 8080

# Command to run the application
CMD ["node", "server.js"]
