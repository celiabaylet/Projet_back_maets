// src/services/GameService.js
import { Game, User } from "../models/index.js";


export async function createGame({ title, description, releaseDate }) {
  if (!title) throw new Error("Le titre du jeu est obligatoire");
  const game = await Game.create({ title, description, releaseDate });
  return game;
}

export async function getAllGames() {
  return await Game.findAll({ include: User });
}

export async function getGameById(id) {
  const game = await Game.findByPk(id, { include: User });
  if (!game) throw new Error("Jeu introuvable");
  return game;
}

export async function updateGame(id, data) {
  const game = await Game.findByPk(id);
  if (!game) throw new Error("Jeu introuvable");

  await game.update(data);
  return game;
}

export async function deleteGame(id) {
  const game = await Game.findByPk(id);
  if (!game) throw new Error("Jeu introuvable");

  await game.destroy();
  return { message: "Jeu supprimé avec succès" };
}
