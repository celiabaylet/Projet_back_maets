// src/db/postgres.js
import { Sequelize } from "sequelize";
import { DATABASE_URL } from "../config/config.js";

export const sequelize = new Sequelize(DATABASE_URL, {
  dialect: "postgres",
  logging: false,
});

export const testPostgres = async () => {
  try {
    await sequelize.authenticate();
    console.log("Connected to PostgreSQL via Sequelize");
  } catch (err) {
    console.error("PostgreSQL connection failed:", err);
  }
};

export default sequelize;
