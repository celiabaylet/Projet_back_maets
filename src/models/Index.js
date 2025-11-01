// src/models/index.js
import { sequelize } from "../db/postgres.js";
import dotenv from "dotenv";

import {User} from "./User.js";
import {Role} from "./Role.js";
import {Game} from "./Game.js";
import {UserGame} from "./UserGame.js";
import {UserRole} from "./UserRole.js";

dotenv.config();


User.belongsToMany(Role, {
  through: UserRole,
  foreignKey: "UserId",   
  otherKey: "RoleId",
});

Role.belongsToMany(User, {
  through: UserRole,
  foreignKey: "RoleId",
  otherKey: "UserId",
});

User.belongsToMany(Game, {
  through: UserGame,
  foreignKey: "userId",
  otherKey: "gameId",
});

Game.belongsToMany(User, {
  through: UserGame,
  foreignKey: "gameId",
  otherKey: "userId",
});

sequelize
  .sync({ alter: true })
  .then(() => console.log("Tables synchronisées avec PostgreSQL"))
  .catch((err) => console.error("Erreur de synchronisation :", err));

sequelize
  .authenticate()
  .then(() => console.log("Connexion à PostgreSQL OK"))
  .catch((err) => console.error("Erreur de connexion :", err));


export { sequelize, User, Role, Game, UserGame, UserRole };

