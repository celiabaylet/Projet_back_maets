// src/models/index.js
const { Sequelize, DataTypes } = require("sequelize");
require("dotenv").config();

// Connexion à PostgreSQL
const sequelize = new Sequelize(process.env.DATABASE_URL, {
  dialect: "postgres",
  logging: false,
});

// Import des modèles
const User = require("./User")(sequelize, DataTypes);
const Role = require("./Role")(sequelize, DataTypes);
const Game = require("./Game")(sequelize, DataTypes);
const UserGame = require("./UserGame")(sequelize, DataTypes);
const UserRole = require("./UserRole")(sequelize, DataTypes);

// Crée l'objet models
const models = { User, Role, Game, UserGame, UserRole };

// 🔗 Associations
User.belongsToMany(Role, {
  through: UserRole,
  foreignKey: "UserId",   // 🟢 correspond à ta table user_role
  otherKey: "RoleId",
});

Role.belongsToMany(User, {
  through: UserRole,
  foreignKey: "RoleId",
  otherKey: "UserId",
});

User.belongsToMany(Game, {
  through: UserGame,
  foreignKey: "UserId",
  otherKey: "GameId",
});

Game.belongsToMany(User, {
  through: UserGame,
  foreignKey: "GameId",
  otherKey: "UserId",
});

// Synchronisation automatique
sequelize
  .sync({ alter: true })
  .then(() => console.log("✅ Tables synchronisées avec PostgreSQL"))
  .catch((err) => console.error("❌ Erreur de synchronisation :", err));

// Vérification de connexion
sequelize
  .authenticate()
  .then(() => console.log("✅ Connexion à PostgreSQL OK"))
  .catch((err) => console.error("❌ Erreur de connexion :", err));

module.exports = { sequelize, models, User, Role, Game, UserGame, UserRole };
