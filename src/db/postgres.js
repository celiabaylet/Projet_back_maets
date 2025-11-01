// src/db/postgres.js
import { Sequelize } from "sequelize";
import { DATABASE_URL } from "../config/config.js";

// Crée une instance Sequelize
export const sequelize = new Sequelize(DATABASE_URL, {
  dialect: "postgres",
  logging: false, // false pour désactiver les logs SQL
});

// Fonction de test de connexion
export const testPostgres = async () => {
  try {
    await sequelize.authenticate();
    console.log("Connected to PostgreSQL via Sequelize");
  } catch (err) {
    console.error("PostgreSQL connection failed:", err);
  }
};

export default sequelize;
