// models/Role.js
module.exports = (sequelize, DataTypes) => {
  const Role = sequelize.define("Role", {
    name: {
      type: DataTypes.STRING(50),
      allowNull: false,
      unique: true
    }
  }, {
    tableName: "role",
    timestamps: false
  });

  Role.associate = (models) => {
    Role.belongsToMany(models.User, {
      through: models.UserRole,
      foreignKey: "roleId",
      otherKey: "userId"
    });
  };

  return Role;
};
