const jwt = require("jsonwebtoken");

// Middleware pour vérifier le token JWT
function authenticateToken(req, res, next) {
  const authHeader = req.headers["authorization"]; // Ex: "Bearer eyJhbGci..."
  const token = authHeader && authHeader.split(" ")[1];

  if (!token) {
    return res.status(401).json({ message: "Accès refusé. Token manquant." });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded; // On attache l'utilisateur décodé à req.user
    next(); // Passe au contrôleur suivant
  } catch (err) {
    return res.status(403).json({ message: "Token invalide ou expiré." });
  }
}

module.exports = authenticateToken;
