const express = require("express");
const app = express();
require("dotenv").config();

app.use(express.json());
app.use(express.urlencoded({ extended: true })); //si jamais form data envoyé

// Route racine
app.get("/", (req, res) => {
  res.send("Backend Maets fonctionne !");
});

// Import des routes
const userRoutes = require("./routes/userRoutes");
app.use("/api/users", userRoutes);

const authRoutes = require("./routes/authRoutes");
app.use("/api/auth", authRoutes);

const gameRoutes = require("./routes/gameRoutes");
app.use("/api/games", gameRoutes);

// Port dynamique
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Serveur démarré sur le port ${PORT}`));
