// models/UserRole.js
import { sequelize } from "./index.js";
import { DataTypes } from "sequelize";
export const UserRole = sequelize.define(
    "UserRole",
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      UserId: {  
        type: DataTypes.INTEGER,
        references: { model: "user", key: "id" },
      },
      RoleId: {   
        type: DataTypes.INTEGER,
        references: { model: "role", key: "id" },
      },
      assignedAt: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW,
      },
    },
    {
      tableName: "user_role",
      timestamps: false,
    }
  );
