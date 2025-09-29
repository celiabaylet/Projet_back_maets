// models/Game.js
module.exports = (sequelize, DataTypes) => {
  const Game = sequelize.define("Game", {
    title: {
      type: DataTypes.STRING(100),
      allowNull: false
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    releaseDate: {
      type: DataTypes.DATE,
      allowNull: true
    }
  }, {
    tableName: "game",
    timestamps: true
  });

  Game.associate = (models) => {
    Game.belongsToMany(models.User, {
      through: models.UserGame,
      foreignKey: "gameId",
      otherKey: "userId"
    });
  };

  return Game;
};
