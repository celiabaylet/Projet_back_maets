// models/User.js
import { sequelize } from "./index.js";
import { DataTypes } from "sequelize";

export const User = sequelize.define(
    "User",
    {
      username: {
        type: DataTypes.STRING(50),
        allowNull: false,
        unique: true,
      },
      email: {
        type: DataTypes.STRING(100),
        allowNull: false,
        unique: true,
      },
      password: {
        type: DataTypes.STRING(255),
        allowNull: false,
      },
    },
    {
      tableName: "user",
      timestamps: true,
    }
  );
