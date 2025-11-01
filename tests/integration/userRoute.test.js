// tests/integration/userRoute.test.js
import request from "supertest";
import express from "express";
import userRouter from "../../src/routes/userRoutes.js";

// Mock du service UserService
import * as UserService from "../../src/services/UserService.js";
jest.mock("../../src/services/UserService.js");

const app = express();
app.use(express.json());
app.use("/users", userRouter);

describe("Intégration routes /users", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  test("GET /users - doit retourner tous les utilisateurs", async () => {
    UserService.getAllUsers.mockResolvedValue([
      { id: 1, username: "johndoe", email: "johndoe@example.com" }
    ]);

    const res = await request(app).get("/users");
    expect(res.status).toBe(200);
    expect(res.body).toHaveLength(1);
    expect(res.body[0].username).toBe("johndoe");
  });

  test("GET /users/:id - doit retourner un utilisateur par ID", async () => {
    UserService.getUserById.mockResolvedValue({ id: 1, username: "johndoe", email: "johndoe@example.com" });

    const res = await request(app).get("/users/1");
    expect(res.status).toBe(200);
    expect(res.body.username).toBe("johndoe");
  });

  test("PUT /users/:id - doit mettre à jour un utilisateur", async () => {
    const updatedUser = { id: 1, username: "johnny", email: "johnny@example.com" };
    UserService.updateUser.mockResolvedValue(updatedUser);

    const res = await request(app)
      .put("/users/1")
      .send({ username: "johnny", email: "johnny@example.com" });

    expect(res.status).toBe(200);
    expect(res.body.username).toBe("johnny");
  });

  test("DELETE /users/:id - doit supprimer un utilisateur", async () => {
    UserService.deleteUser.mockResolvedValue({ message: "Utilisateur supprimé" });

    const res = await request(app).delete("/users/1");
    expect(res.status).toBe(200);
    expect(res.body.message).toBe("Utilisateur supprimé");
  });

  test("POST /users/:id/games - doit ajouter des jeux à un utilisateur", async () => {
    const updatedUser = { id: 1, username: "johndoe", games: [1, 2, 5] };
    UserService.addGamesToUser.mockResolvedValue(updatedUser);

    const res = await request(app)
      .post("/users/1/games")
      .send({ gameIds: [1, 2, 5] });

    expect(res.status).toBe(200);
    expect(res.body.games).toEqual([1, 2, 5]);
  });
});
