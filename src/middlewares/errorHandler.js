// src/middlewares/errorHandler.js
export default function errorHandler(err, req, res, next) {
  console.error(" Erreur interceptée :", err.stack || err.message);

  const statusCode = err.status || 500;

  res.status(statusCode).json({
    success: false,
    message: err.message || "Erreur interne du serveur",
    ...(process.env.NODE_ENV !== "production" && { stack: err.stack }),
  });
}
