const express = require("express");
const router = express.Router();
const authenticateToken = require("../middlewares/authMiddleware");

// Exemple de route sécurisée
router.get("/ma-librairie", authenticateToken, (req, res) => {
  // req.user contient maintenant l'id et autres infos du token
  res.json({ message: `Bienvenue utilisateur ${req.user.id}`, user: req.user });
});

module.exports = router;
