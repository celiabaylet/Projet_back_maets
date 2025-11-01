// src/controllers/UserController.js
import * as UserService from "../services/UserService.js";

export async function getAllUsers(req, res) {
  try {
    const users = await UserService.getAllUsers();
    res.json(users);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
}

export async function getUserById(req, res) {
  try {
    const user = await UserService.getUserById(req.params.id);
    res.json(user);
  } catch (error) {
    console.error(error);
    res.status(404).json({ error: error.message });
  }
}

export async function updateUser(req, res) {
  try {
    const updatedUser = await UserService.updateUser(req.params.id, req.body);
    res.json(updatedUser);
  } catch (error) {
    console.error(error);
    res.status(400).json({ error: error.message });
  }
}

export async function deleteUser(req, res) {
  try {
    const result = await UserService.deleteUser(req.params.id);
    res.json(result);
  } catch (error) {
    console.error(error);
    res.status(400).json({ error: error.message });
  }
}

export async function addGamesToUser(req, res) {
  try {
    const { gameIds } = req.body; 
    const userId = req.params.id; 
    const updatedUser = await UserService.addGamesToUser(userId, gameIds);
    res.json(updatedUser);
  } catch (error) {
    console.error(error);
    res.status(400).json({ error: error.message });
  }
}
