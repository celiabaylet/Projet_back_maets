// src/routes/gameConfigRoutes.js
import express from "express";
import { createConfig, getConfigByGame, updateConfig } from "../controllers/GameConfigController.js";
import authenticateToken from "../middlewares/authMiddleware.js";

const router = express.Router();

/**
 * @swagger
 * /config/{gameId}:
 *   post:
 *     summary: Crée une configuration pour un jeu spécifique
 *     tags: [GameConfig]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: gameId
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID du jeu concerné (lié au jeu dans PostgreSQL)
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               settings:
 *                 type: object
 *                 example:
 *                   difficulty: "medium"
 *                   volume: 75
 *     responses:
 *       201:
 *         description: Configuration créée avec succès
 *       400:
 *         description: Données invalides ou configuration déjà existante
 *       401:
 *         description: Accès refusé - Token manquant ou invalide
 *       500:
 *         description: Erreur serveur
 */
router.post("/:gameId", authenticateToken, createConfig);

/**
 * @swagger
 * /config/{gameId}:
 *   get:
 *     summary: Récupère la configuration d’un jeu spécifique
 *     tags: [GameConfig]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: gameId
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID du jeu concerné
 *     responses:
 *       200:
 *         description: Configuration récupérée avec succès
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 _id:
 *                   type: string
 *                   example: 69051d50b4caecb23c7318ae
 *                 gameId:
 *                   type: integer
 *                   example: 1
 *                 settings:
 *                   type: object
 *                   example:
 *                     difficulty: "medium"
 *                     volume: 75
 *                 lastUpdated:
 *                   type: string
 *                   format: date-time
 *       404:
 *         description: Configuration non trouvée
 *       401:
 *         description: Accès refusé - Token manquant ou invalide
 *       500:
 *         description: Erreur serveur
 */
router.get("/:gameId", authenticateToken, getConfigByGame);

/**
 * @swagger
 * /config/{gameId}:
 *   put:
 *     summary: Met à jour la configuration d’un jeu
 *     tags: [GameConfig]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: gameId
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID du jeu concerné
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               settings:
 *                 type: object
 *                 example:
 *                   difficulty: "hard"
 *                   volume: 50
 *     responses:
 *       200:
 *         description: Configuration mise à jour avec succès
 *       400:
 *         description: Données invalides
 *       401:
 *         description: Accès refusé - Token manquant ou invalide
 *       404:
 *         description: Configuration non trouvée
 *       500:
 *         description: Erreur serveur
 */
router.put("/:gameId", authenticateToken, updateConfig);

export default router;
