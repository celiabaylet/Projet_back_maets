// src/controllers/AuthController.js
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { models } = require("../models");
const { User } = models;

// Inscription
exports.register = async (req, res) => {
  try {
    const { username, email, password } = req.body;

    if (!username || !email || !password) {
      return res.status(400).json({ error: "Username, email et password requis" });
    }

    // Vérifie si email OU username déjà utilisés
    const existing = await User.findOne({ 
      where: { [require("sequelize").Op.or]: [{ email }, { username }] }
    });
    if (existing) {
      return res.status(400).json({ error: "Email ou username déjà utilisé" });
    }
    console.log("Mot de passe reçu dans register:", password);

    const hashed = await bcrypt.hash(password, 10);
    console.log("Mot de passe hashé avant création:", hashed);

    const user = await User.create({ username, email, password: hashed });

    res.status(201).json({ message: "Utilisateur créé", id: user.id });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erreur lors de l'inscription" });
  }
};

// Connexion
exports.login = async (req, res) => {
  console.log("Body reçu :", req.body);

  try {
    const { username, password } = req.body;
    if (!username || !password) {
      return res.status(400).json({ error: "Username et password requis" });
    }

    // Recherche par username
    const user = await User.findOne({ where: { username } });
    if (!user) {
      return res.status(401).json({ error: "Utilisateur introuvable" });
    }

    console.log("Mot de passe entré:", password);
    console.log("Hash en base:", user.password);

    // Vérifie le mot de passe
    const valid = await bcrypt.compare(password, user.password);
    console.log("Résultat de la comparaison:", valid);

    if (!valid) {
      return res.status(401).json({ error: "Mot de passe incorrect" });
    }

    // Génère le token
    const token = jwt.sign(
      { id: user.id, username: user.username },
      process.env.JWT_SECRET,
      { expiresIn: "1h" }
    );

    res.json({ token });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Erreur lors de la connexion" });
  }
};
