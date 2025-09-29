//demarrage du serveur
const app = require('./app');
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Serveur démarré sur le port ${PORT}`));


import express from 'express';
import { DATABASE_URL, MONGO_URI } from './config/config.js';

const app = express();
// Exemple d'utilisation
console.log('Postgres :', DATABASE_URL);
console.log('Mongo :', MONGO_URI);

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
