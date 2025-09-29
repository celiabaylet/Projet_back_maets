// src/controllers/UserController.js
const { models } = require("../models");
const { User, Role } = models;

exports.createUser = async (req, res) => {
  try {
    const { username, email, password, roleId } = req.body;

    // Crée l'utilisateur
    const user = await User.create({ username, email, password });

    // Si roleId fourni, lie le rôle
    if (roleId) {
      const role = await Role.findByPk(roleId);
      if (!role) return res.status(400).json({ error: "Rôle inexistant" });

      await user.addRole(role); // Sequelize gère UserRole
    }

    // Retourne l'utilisateur avec les rôles attachés
    const userWithRoles = await User.findByPk(user.id, { include: Role });
    res.status(201).json(userWithRoles);
  } catch (err) {
    console.error(err);
    res.status(400).json({ error: err.message });
  }
};

exports.getUsers = async (req, res) => {
  try {
    const users = await User.findAll({ include: Role });
    res.json(users);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "Impossible de récupérer les utilisateurs" });
  }
};