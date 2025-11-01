// src/controllers/GameController.js
import * as GameService from "../services/GameService.js";

// Création d'un jeu
export async function createGame(req, res) {
  try {
    const game = await GameService.createGame(req.body);
    res.status(201).json(game);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
}

// Récupération de tous les jeux
export async function getAllGames(req, res) {
  try {
    const games = await GameService.getAllGames();
    res.json(games);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
}

// Récupération d'un jeu par ID
export async function getGameById(req, res) {
  try {
    const game = await GameService.getGameById(req.params.id);
    res.json(game);
  } catch (err) {
    res.status(404).json({ error: err.message });
  }
}

// Mise à jour d'un jeu
export async function updateGame(req, res) {
  try {
    const game = await GameService.updateGame(req.params.id, req.body);
    res.json(game);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
}

// Suppression d'un jeu
export async function deleteGame(req, res) {
  try {
    const result = await GameService.deleteGame(req.params.id);
    res.json(result);
  } catch (err) {
    res.status(404).json({ error: err.message });
  }
}
