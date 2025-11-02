// src/services/UserService.js
import { User, Role, Game } from "../models/index.js"; 
import bcrypt from "bcrypt";

export async function getUserById(id) {
  try {
    const user = await User.findByPk(id);
    if (!user) throw new Error("Utilisateur non trouvé");
    return user;
  } catch (error) {
    throw new Error(`Erreur lors de la récupération de l'utilisateur : ${error.message}`);
  }
}

export async function getAllUsers() {
  try {
    const users = await User.findAll(); 
    return users;
  } catch (error) {
    throw new Error(`Erreur lors de la récupération des utilisateurs : ${error.message}`);
  }
}

export async function updateUser(id, data) {
  try {
    const user = await User.findByPk(id);
    if (!user) throw new Error("Utilisateur non trouvé");

    if (data.password) {
      const hashed = await bcrypt.hash(data.password, 10);
      data.password = hashed;
    }

    await user.update(data);

    return await User.findByPk(id);
  } catch (error) {
    throw new Error(`Erreur lors de la mise à jour : ${error.message}`);
  }
}

export async function deleteUser(id) {
  try {
    const user = await User.findByPk(id);
    if (!user) throw new Error("Utilisateur non trouvé");

    await user.destroy();
    return { message: "Utilisateur supprimé avec succès" };
  } catch (error) {
    throw new Error(`Erreur lors de la suppression : ${error.message}`);
  }
}

export async function addGamesToUser(userId, gameIds) {
  try {
    const user = await User.findByPk(userId);
    if (!user) throw new Error("Utilisateur introuvable");

    if (!Array.isArray(gameIds)) {
      throw new Error("Les identifiants de jeux doivent être fournis sous forme de tableau");
    }

    const games = await Game.findAll({
      where: { id: gameIds },
    });

    if (games.length === 0) {
      throw new Error("Aucun jeu trouvé avec les identifiants fournis");
    }

    await user.addGames(games);

    return await User.findByPk(userId, { include: [Role, Game] });
  } catch (error) {
    throw new Error(`Erreur lors de l'association des jeux : ${error.message}`); 
  }
}

