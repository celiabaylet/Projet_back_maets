// models/User.js
const bcrypt = require("bcrypt");

module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define("User", {
    username: {
      type: DataTypes.STRING(50),
      allowNull: false,
      unique: true
    },
    email: {
      type: DataTypes.STRING(100),
      allowNull: false,
      unique: true
    },
    password: {
      type: DataTypes.STRING(255),
      allowNull: false
    }
  }, {
    tableName: "user",
    timestamps: true
  });

  User.associate = (models) => {
    User.belongsToMany(models.Role, {
      through: models.UserRole,
      foreignKey: "userId",
      otherKey: "roleId"
    });
    User.belongsToMany(models.Game, {
      through: models.UserGame,
      foreignKey: "userId",
      otherKey: "gameId"
    });
  };

  // Hash password before save
  User.beforeCreate(async (user) => {
    const salt = await bcrypt.genSalt(10);
    user.password = await bcrypt.hash(user.password, salt);
  });

  return User;
};
