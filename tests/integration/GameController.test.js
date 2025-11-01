// tests/game.test.js
import request from "supertest";
import express from "express";
import gameRoutes from "../../src/routes/gameRoutes.js"; // tes routes
import bodyParser from "body-parser";

// Crée une instance Express pour les tests
const app = express();
app.use(bodyParser.json());
app.use("/games", gameRoutes);

// Mock du middleware d'authentification pour tests
jest.mock("../../src/middlewares/authMiddleware.js", () => {
  return (req, res, next) => next();
});

describe("Game API Integration Tests", () => {
  let createdGameId;

  // Test création de jeu
  it("POST /games - doit créer un nouveau jeu", async () => {
    const response = await request(app)
      .post("/games")
      .send({
        title: "Test Game",
        description: "Un jeu de test",
        releaseDate: "2025-11-01"
      });

    expect(response.status).toBe(201);
    expect(response.body).toHaveProperty("id");
    expect(response.body.title).toBe("Test Game");

    createdGameId = response.body.id;
  });

  // Test récupération de tous les jeux
  it("GET /games - doit récupérer tous les jeux", async () => {
    const response = await request(app).get("/games");

    expect(response.status).toBe(200);
    expect(Array.isArray(response.body)).toBe(true);
    expect(response.body.some(game => game.id === createdGameId)).toBe(true);
  });

  // Test récupération d'un jeu par ID
  it("GET /games/:id - doit récupérer un jeu par ID", async () => {
    const response = await request(app).get(`/games/${createdGameId}`);

    expect(response.status).toBe(200);
    expect(response.body.id).toBe(createdGameId);
    expect(response.body.title).toBe("Test Game");
  });

  // Test mise à jour d'un jeu
  it("PUT /games/:id - doit mettre à jour un jeu", async () => {
    const response = await request(app)
      .put(`/games/${createdGameId}`)
      .send({ title: "Test Game Updated" });

    expect(response.status).toBe(200);
    expect(response.body.title).toBe("Test Game Updated");
  });

  // Test suppression d'un jeu
  it("DELETE /games/:id - doit supprimer un jeu", async () => {
    const response = await request(app).delete(`/games/${createdGameId}`);

    expect(response.status).toBe(200);
    expect(response.body).toHaveProperty("message");
  });
});
