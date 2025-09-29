// src/controllers/AuthController.js
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { models } = require("../models");
const { User } = models; // 🔑 récupération via index.js

// Inscription
exports.register = async (req, res) => {
  try {
    const { username, email, password } = req.body;

    // Vérifie si l'utilisateur existe déjà
    const existing = await User.findOne({ where: { email } });
    if (existing) {
      return res.status(400).json({ error: "Email déjà utilisé" });
    }

    const hashed = await bcrypt.hash(password, 10);
    const user = await User.create({ username, email, password: hashed });

    res.status(201).json({ message: "Utilisateur créé", id: user.id });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erreur lors de l'inscription" });
  }
};

// Connexion
exports.login = async (req, res) => {
  try {
    const { email, password } = req.body;

    // Recherche par email (tu peux garder username si tu préfères)
    const user = await User.findOne({ where: { email } });
    if (!user) {
      return res.status(401).json({ error: "Utilisateur introuvable" });
    }

      // 🔹 Ajoute ces lignes pour debug
    console.log("Mot de passe entré:", password);
    console.log("Hash en base:", user.password);

    // Vérifie le mot de passe
    const valid = await bcrypt.compare(password, user.password);
    if (!valid) {
      return res.status(401).json({ error: "Mot de passe incorrect" });
    }

    // Génère le token
    const token = jwt.sign(
      { id: user.id, email: user.email },
      process.env.JWT_SECRET,
      { expiresIn: "1h" }
    );

    res.json({ token });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erreur lors de la connexion" });
  }
};
