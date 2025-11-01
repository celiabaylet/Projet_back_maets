import GameConfigService from "../services/GameConfigService.js";

// POST : création explicite d'une config
export const createConfig = async (req, res) => {
  try {
    const config = await GameConfigService.createConfig(
      parseInt(req.params.gameId),
      req.body.settings
    );
    res.status(201).json(config);
  } catch (err) {
    console.error("Erreur createConfig :", err.message);
    res.status(400).json({ error: err.message });
  }
};

// GET : récupère la config (créée automatiquement si inexistante)
export const getConfigByGame = async (req, res) => {
  try {
    const config = await GameConfigService.getConfigByGame(parseInt(req.params.gameId));
    res.json(config);
  } catch (err) {
    console.error("Erreur getConfigByGame :", err.message);
    res.status(404).json({ error: err.message });
  }
};

// PUT : met à jour ou crée la config
export const updateConfig = async (req, res) => {
  try {
    const updatedConfig = await GameConfigService.updateConfig(
      parseInt(req.params.gameId),
      req.body
    );
    res.json(updatedConfig);
  } catch (err) {
    console.error("Erreur updateConfig :", err.message);
    res.status(400).json({ error: err.message });
  }
};
