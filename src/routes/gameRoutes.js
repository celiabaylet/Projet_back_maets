// src/routes/gameRoutes.js
import express from "express";
import authenticateToken from "../middlewares/authMiddleware.js";
import { createGame, getAllGames, getGameById, updateGame, deleteGame } from "../controllers/GameController.js";

const router = express.Router();

/**
 * @swagger
 * /games:
 *   post:
 *     summary: Ajoute un nouveau jeu
 *     tags: [Games]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - title
 *             properties:
 *               title:
 *                 type: string
 *                 example: The Legend of Zelda Breath of the Wild
 *               description:
 *                 type: string
 *                 example: Un jeu d'aventure en monde ouvert développé par Nintendo.
 *               releaseDate:
 *                 type: string
 *                 format: date
 *                 example: 2017-03-03
 *     responses:
 *       201:
 *         description: Jeu créé avec succès
 *       400:
 *         description: Données invalides
 *       401:
 *         description: Token manquant ou invalide
 */
router.post("/", authenticateToken, createGame);

/**
 * @swagger
 * /games:
 *   get:
 *     summary: Récupère la liste de tous les jeux
 *     tags: [Games]
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Liste des jeux récupérée avec succès
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 type: object
 *                 properties:
 *                   id:
 *                     type: integer
 *                     example: 1
 *                   title:
 *                     type: string
 *                     example: Super Mario Odyssey
 *                   description:
 *                     type: string
 *                     example: Jeu de plateforme en 3D développé par Nintendo.
 *                   releaseDate:
 *                     type: string
 *                     format: date
 *                     example: 2017-10-27
 *       401:
 *         description: Token manquant ou invalide
 */
router.get("/", authenticateToken, getAllGames);

/**
 * @swagger
 * /games/{id}:
 *   get:
 *     summary: Récupère un jeu par son ID
 *     tags: [Games]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID du jeu
 *     responses:
 *       200:
 *         description: Jeu trouvé
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 id:
 *                   type: integer
 *                   example: 1
 *                 title:
 *                   type: string
 *                   example: Mario Kart 8 Deluxe
 *                 description:
 *                   type: string
 *                   example: Jeu de course développé par Nintendo.
 *                 releaseDate:
 *                   type: string
 *                   format: date
 *                   example: 2017-04-28
 *       404:
 *         description: Jeu non trouvé
 *       401:
 *         description: Token manquant ou invalide
 */
router.get("/:id", authenticateToken, getGameById);

/**
 * @swagger
 * /games/{id}:
 *   put:
 *     summary: Met à jour un jeu
 *     tags: [Games]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID du jeu à modifier
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               title:
 *                 type: string
 *                 example: The Legend of Zelda Tears of the Kingdom
 *               description:
 *                 type: string
 *                 example: Suite de Breath of the Wild
 *               releaseDate:
 *                 type: string
 *                 format: date
 *                 example: 2023-05-12
 *     responses:
 *       200:
 *         description: Jeu mis à jour avec succès
 *       400:
 *         description: Données invalides
 *       404:
 *         description: Jeu non trouvé
 *       401:
 *         description: Token manquant ou invalide
 */
router.put("/:id", authenticateToken, updateGame);

/**
 * @swagger
 * /games/{id}:
 *   delete:
 *     summary: Supprime un jeu
 *     tags: [Games]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID du jeu à supprimer
 *     responses:
 *       200:
 *         description: Jeu supprimé avec succès
 *       404:
 *         description: Jeu non trouvé
 *       401:
 *         description: Token manquant ou invalide
 */
router.delete("/:id", authenticateToken, deleteGame);

export default router;
