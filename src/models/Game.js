// models/Game.js
import { sequelize } from "./index.js";
import { DataTypes } from "sequelize";

export const Game = sequelize.define(
    "Game",
    {
      title: {
        type: DataTypes.STRING(100),
        allowNull: false,
      },
      description: {
        type: DataTypes.TEXT,
        allowNull: true,
      },
      releaseDate: {
        type: DataTypes.DATE,
        allowNull: true,
      },
    },
    {
      tableName: "game",
      timestamps: true,
    }
  );

