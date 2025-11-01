// models/Role.js
import { sequelize } from "./index.js";
import { DataTypes } from "sequelize";

 export const Role = sequelize.define(
    "Role",
    {
      name: {
        type: DataTypes.STRING(50),
        allowNull: false,
        unique: true,
      },
    },
    {
      tableName: "role",
      timestamps: false,
    }
  );
