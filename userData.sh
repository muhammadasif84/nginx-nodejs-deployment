#!/bin/bash

APP_DIR="/home/ubuntu/nodejs-app"
mkdir -p "$APP_DIR"
cd "$APP_DIR"


cat << 'EOF' > server.js
const http = require('http');
const port = 80;
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Node.js server is running on Ubuntu EC2  \n');
});
server.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
EOF


if ! command -v node &> /dev/null; then
  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

sudo npm install -g pm2

pm2 start server.js --name "nodejs-app"
pm2 save
pm2 startup | sudo bash

