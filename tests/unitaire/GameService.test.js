// tests/unitaire/GameService.test.js
import * as GameService from "../../src/services/GameService.js";
import { Game, User } from "../../src/models/index.js";

jest.mock("../../src/models/index.js", () => ({
  Game: {
    create: jest.fn(),
    findAll: jest.fn(),
    findByPk: jest.fn()
  },
  User: {}
}));

describe("Unit tests GameService", () => {

  beforeEach(() => {
    jest.clearAllMocks();
  });

  describe("createGame", () => {
    it("doit créer un jeu avec succès", async () => {
      const gameData = { title: "Zelda", description: "Aventure", releaseDate: "2023-01-01" };
      Game.create.mockResolvedValue(gameData);

      const result = await GameService.createGame(gameData);
      expect(Game.create).toHaveBeenCalledWith(gameData);
      expect(result).toEqual(gameData);
    });

    it("doit lancer une erreur si le titre est manquant", async () => {
      await expect(GameService.createGame({ description: "desc" }))
        .rejects
        .toThrow("Le titre du jeu est obligatoire");
    });
  });

  describe("getAllGames", () => {
    it("doit retourner tous les jeux avec les utilisateurs", async () => {
      const games = [{ id: 1, title: "Zelda" }];
      Game.findAll.mockResolvedValue(games);

      const result = await GameService.getAllGames();
      expect(Game.findAll).toHaveBeenCalledWith({ include: User });
      expect(result).toEqual(games);
    });
  });

  describe("getGameById", () => {
    it("doit retourner un jeu existant", async () => {
      const game = { id: 1, title: "Mario" };
      Game.findByPk.mockResolvedValue(game);

      const result = await GameService.getGameById(1);
      expect(Game.findByPk).toHaveBeenCalledWith(1, { include: User });
      expect(result).toEqual(game);
    });

    it("doit lancer une erreur si le jeu n'existe pas", async () => {
      Game.findByPk.mockResolvedValue(null);
      await expect(GameService.getGameById(999)).rejects.toThrow("Jeu introuvable");
    });
  });

  describe("updateGame", () => {
    it("doit mettre à jour un jeu existant", async () => {
      const game = { update: jest.fn(), id: 1, title: "Old" };
      Game.findByPk.mockResolvedValue(game);

      const updatedData = { title: "New" };
      await GameService.updateGame(1, updatedData);

      expect(game.update).toHaveBeenCalledWith(updatedData);
    });

    it("doit lancer une erreur si le jeu n'existe pas", async () => {
      Game.findByPk.mockResolvedValue(null);
      await expect(GameService.updateGame(999, { title: "Test" })).rejects.toThrow("Jeu introuvable");
    });
  });

  describe("deleteGame", () => {
    it("doit supprimer un jeu existant", async () => {
      const game = { destroy: jest.fn() };
      Game.findByPk.mockResolvedValue(game);

      const result = await GameService.deleteGame(1);
      expect(game.destroy).toHaveBeenCalled();
      expect(result).toEqual({ message: "Jeu supprimé avec succès" });
    });

    it("doit lancer une erreur si le jeu n'existe pas", async () => {
      Game.findByPk.mockResolvedValue(null);
      await expect(GameService.deleteGame(999)).rejects.toThrow("Jeu introuvable");
    });
  });

});
