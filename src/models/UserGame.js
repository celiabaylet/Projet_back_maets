// models/UserGame.js
module.exports = (sequelize, DataTypes) => {
  const UserGame = sequelize.define("UserGame", {
    userId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: { model: "user", key: "id" }
    },
    gameId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: { model: "game", key: "id" }
    },
    addedAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: DataTypes.NOW
    }
  }, {
    tableName: "user_game",
    timestamps: false
  });

  return UserGame;
};
