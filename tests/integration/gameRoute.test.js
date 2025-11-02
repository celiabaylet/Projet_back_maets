// tests/integration/GameRoutes.test.js
import request from "supertest";
import express from "express";
import gameRouter from "../../src/routes/gameRoutes.js";

jest.mock("../../src/middlewares/authMiddleware.js", () => {
  return (req, res, next) => next();
});

import * as GameService from "../../src/services/GameService.js";
jest.mock("../../src/services/GameService.js");

const app = express();
app.use(express.json());
app.use("/games", gameRouter);

describe("Intégration routes /games", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  test("GET /games - doit retourner la liste des jeux", async () => {
    GameService.getAllGames.mockResolvedValue([
      { id: 1, title: "Super Mario Odyssey", description: "Plateforme 3D", releaseDate: "2017-10-27" }
    ]);

    const res = await request(app).get("/games");
    expect(res.status).toBe(200);
    expect(res.body).toHaveLength(1);
    expect(res.body[0].title).toBe("Super Mario Odyssey");
  });

  test("GET /games/:id - doit retourner un jeu par ID", async () => {
    GameService.getGameById.mockResolvedValue({
      id: 1,
      title: "Mario Kart 8 Deluxe",
      description: "Jeu de course",
      releaseDate: "2017-04-28"
    });

    const res = await request(app).get("/games/1");
    expect(res.status).toBe(200);
    expect(res.body.title).toBe("Mario Kart 8 Deluxe");
  });

  test("POST /games - doit créer un nouveau jeu", async () => {
    const newGame = { id: 2, title: "Zelda Breath of the Wild", description: "Aventure", releaseDate: "2017-03-03" };
    GameService.createGame.mockResolvedValue(newGame);

    const res = await request(app)
      .post("/games")
      .send({ title: "Zelda Breath of the Wild", description: "Aventure", releaseDate: "2017-03-03" });

    expect(res.status).toBe(201);
    expect(res.body.id).toBe(2);
    expect(res.body.title).toBe("Zelda Breath of the Wild");
  });

  test("PUT /games/:id - doit mettre à jour un jeu", async () => {
    const updatedGame = { id: 1, title: "Zelda TOTK", description: "Suite de BOTW", releaseDate: "2023-05-12" };
    GameService.updateGame.mockResolvedValue(updatedGame);

    const res = await request(app)
      .put("/games/1")
      .send({ title: "Zelda TOTK", description: "Suite de BOTW", releaseDate: "2023-05-12" });

    expect(res.status).toBe(200);
    expect(res.body.title).toBe("Zelda TOTK");
  });

  test("DELETE /games/:id - doit supprimer un jeu", async () => {
    GameService.deleteGame.mockResolvedValue({ message: "Jeu supprimé avec succès" });

    const res = await request(app).delete("/games/1");
    expect(res.status).toBe(200);
    expect(res.body.message).toBe("Jeu supprimé avec succès");
  });
});
