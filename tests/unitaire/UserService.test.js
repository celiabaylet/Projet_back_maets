// tests/unitaire/UserService.test.js
import * as UserService from "../../src/services/UserService.js";
import { User, Game, Role } from "../../src/models/index.js";
import bcrypt from "bcrypt";

jest.mock("../../src/models/index.js", () => ({
  User: {
    findByPk: jest.fn(),
    findAll: jest.fn()
  },
  Game: {
    findAll: jest.fn()
  },
  Role: {}
}));

jest.mock("bcrypt", () => ({
  hash: jest.fn()
}));

describe("Unit tests UserService", () => {

  beforeEach(() => {
    jest.clearAllMocks();
  });

  describe("getUserById", () => {
    it("doit retourner un utilisateur existant", async () => {
      const user = { id: 1, username: "johndoe" };
      User.findByPk.mockResolvedValue(user);

      const result = await UserService.getUserById(1);
      expect(User.findByPk).toHaveBeenCalledWith(1);
      expect(result).toEqual(user);
    });

    it("doit lancer une erreur si l'utilisateur n'existe pas", async () => {
      User.findByPk.mockResolvedValue(null);
      await expect(UserService.getUserById(999))
        .rejects.toThrow("Utilisateur non trouvé");
    });
  });

  describe("getAllUsers", () => {
    it("doit retourner tous les utilisateurs", async () => {
      const users = [{ id: 1, username: "johndoe" }];
      User.findAll.mockResolvedValue(users);

      const result = await UserService.getAllUsers();
      expect(User.findAll).toHaveBeenCalled();
      expect(result).toEqual(users);
    });
  });

  describe("updateUser", () => {
    it("doit mettre à jour un utilisateur et hasher le mot de passe", async () => {
      const user = { update: jest.fn() };
      User.findByPk.mockResolvedValueOnce(user).mockResolvedValueOnce({ id: 1, username: "newuser" });
      bcrypt.hash.mockResolvedValue("hashedpassword");

      const data = { username: "newuser", password: "pass123" };
      const result = await UserService.updateUser(1, data);

      expect(bcrypt.hash).toHaveBeenCalledWith("pass123", 10);
      expect(user.update).toHaveBeenCalledWith({ username: "newuser", password: "hashedpassword" });
      expect(User.findByPk).toHaveBeenCalledWith(1);
      expect(result).toEqual({ id: 1, username: "newuser" });
    });

    it("doit lancer une erreur si l'utilisateur n'existe pas", async () => {
      User.findByPk.mockResolvedValue(null);
      await expect(UserService.updateUser(999, { username: "test" }))
        .rejects.toThrow("Utilisateur non trouvé");
    });
  });

  describe("deleteUser", () => {
    it("doit supprimer un utilisateur existant", async () => {
      const user = { destroy: jest.fn() };
      User.findByPk.mockResolvedValue(user);

      const result = await UserService.deleteUser(1);
      expect(user.destroy).toHaveBeenCalled();
      expect(result).toEqual({ message: "Utilisateur supprimé avec succès" });
    });

    it("doit lancer une erreur si l'utilisateur n'existe pas", async () => {
      User.findByPk.mockResolvedValue(null);
      await expect(UserService.deleteUser(999)).rejects.toThrow("Utilisateur non trouvé");
    });
  });

  describe("addGamesToUser", () => {
    it("doit associer des jeux à un utilisateur", async () => {
      const user = { addGames: jest.fn() };
      const games = [{ id: 1 }, { id: 2 }];

      User.findByPk.mockResolvedValueOnce(user).mockResolvedValueOnce({ id: 1, username: "johndoe", Games: games });
      Game.findAll.mockResolvedValue(games);

      const result = await UserService.addGamesToUser(1, [1, 2]);
      expect(User.findByPk).toHaveBeenCalledTimes(2);
      expect(Game.findAll).toHaveBeenCalledWith({ where: { id: [1, 2] } });
      expect(user.addGames).toHaveBeenCalledWith(games);
      expect(result).toEqual({ id: 1, username: "johndoe", Games: games });
    });

    it("doit lancer une erreur si l'utilisateur n'existe pas", async () => {
      User.findByPk.mockResolvedValue(null);
      await expect(UserService.addGamesToUser(999, [1, 2]))
        .rejects.toThrow("Utilisateur introuvable");
    });

    it("doit lancer une erreur si gameIds n'est pas un tableau", async () => {
      const user = { addGames: jest.fn() };
      User.findByPk.mockResolvedValue(user);

      await expect(UserService.addGamesToUser(1, "notarray"))
        .rejects.toThrow("Les identifiants de jeux doivent être fournis sous forme de tableau");
    });

    it("doit lancer une erreur si aucun jeu trouvé", async () => {
      const user = { addGames: jest.fn() };
      User.findByPk.mockResolvedValue(user);
      Game.findAll.mockResolvedValue([]);

      await expect(UserService.addGamesToUser(1, [99]))
        .rejects.toThrow("Aucun jeu trouvé avec les identifiants fournis");
    });
  });

});
