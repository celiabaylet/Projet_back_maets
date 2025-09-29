module.exports = (sequelize, DataTypes) => {
  const UserRole = sequelize.define("UserRole", {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    UserId: {   // 💡 exactement comme dans la table
      type: DataTypes.INTEGER,
      references: { model: "user", key: "id" }
    },
    RoleId: {   // 💡 exactement comme dans la table
      type: DataTypes.INTEGER,
      references: { model: "role", key: "id" }
    },
    assignedAt: {
      type: DataTypes.DATE,
      defaultValue: DataTypes.NOW
    }
  }, {
    tableName: "user_role",
    timestamps: false
  });

  return UserRole;
};
