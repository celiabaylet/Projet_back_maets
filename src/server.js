// src/server.js
import 'dotenv/config'; 
import fs from 'fs';
import https from 'https';
import http from 'http';
import app from './app.js';
import { testPostgres } from './db/postgres.js';
import { connectMongo } from './db/mongo.js';
import { sequelize } from './models/index.js';

const PORT = process.env.PORT || 3000; 
const HTTPS_PORT = process.env.HTTPS_PORT || 3443; 

async function startServer() {
  try {
    await testPostgres();
    await connectMongo();
    await sequelize.sync({ alter: true });
    console.log('Tables SQL synchronisées');

    const key = fs.readFileSync('./src/certs/server.key');
    const cert = fs.readFileSync('./src/certs/server.cert');

    https.createServer({ key, cert }, app).listen(HTTPS_PORT, () => {
      console.log(`HTTPS Server running on https://localhost:${HTTPS_PORT}`);
    });

    http.createServer((req, res) => {
      res.writeHead(301, { Location: `https://localhost:${HTTPS_PORT}${req.url}` });
      res.end();
    }).listen(PORT, () => {
      console.log(`HTTP redirect server running on http://localhost:${PORT}`);
    });

  } catch (error) {
    console.error('Failed to start server:', error);
    process.exit(1);
  }
}

startServer();