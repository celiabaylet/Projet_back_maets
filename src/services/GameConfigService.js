import GameConfig from "../models/GameConfig.js";

const GameConfigService = {

  async createConfig(gameId, initialSettings = {}) {
    const existingConfig = await GameConfig.findOne({ gameId });
    if (existingConfig) throw new Error("Configuration déjà existante pour ce jeu");

    const config = await GameConfig.create({ gameId, settings: initialSettings });
    return config;
  },

  async getConfigByGame(gameId) {
    let config = await GameConfig.findOne({ gameId });

    if (!config) {
      config = await GameConfig.create({ gameId, settings: {} });
    }

    return config;
  },

  async updateConfig(gameId, configData) {
  const updatedConfig = await GameConfig.findOneAndUpdate(
    { gameId },
    { $set: { ...configData, lastUpdated: new Date() } },
    { new: true, upsert: true }
  );
  return updatedConfig;
  },
};

export default GameConfigService;
