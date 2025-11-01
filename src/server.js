// src/server.js
import 'dotenv/config'; // charge .env
import fs from 'fs';
import https from 'https';
import http from 'http';
import app from './app.js';
import { testPostgres } from './db/postgres.js';
import { connectMongo } from './db/mongo.js';
import { sequelize } from './models/index.js';

const PORT = process.env.PORT || 3000;        // HTTP
const HTTPS_PORT = process.env.HTTPS_PORT || 3443; // HTTPS

async function startServer() {
  try {
    // Connexions aux bases de données
    await testPostgres();
    await connectMongo();
    await sequelize.sync({ alter: true });
    console.log('Tables SQL synchronisées');

    // Lecture des certificats SSL
    const key = fs.readFileSync('./src/certs/server.key');
    const cert = fs.readFileSync('./src/certs/server.cert');

    // Serveur HTTPS principal
    https.createServer({ key, cert }, app).listen(HTTPS_PORT, () => {
      console.log(`HTTPS Server running on https://localhost:${HTTPS_PORT}`);
    });

    // Serveur HTTP secondaire (redirige tout vers HTTPS)
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