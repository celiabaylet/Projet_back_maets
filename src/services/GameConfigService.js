import GameConfig from "../models/GameConfig.js";

const GameConfigService = {

  // Création explicite d'une config pour un jeu
  async createConfig(gameId, initialSettings = {}) {
    const existingConfig = await GameConfig.findOne({ gameId });
    if (existingConfig) throw new Error("Configuration déjà existante pour ce jeu");

    const config = await GameConfig.create({ gameId, settings: initialSettings });
    return config;
  },

  // Récupère la config, crée une config vide si elle n'existe pas
  async getConfigByGame(gameId) {
    let config = await GameConfig.findOne({ gameId });

    if (!config) {
      // crée une config vide si elle n’existe pas
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
