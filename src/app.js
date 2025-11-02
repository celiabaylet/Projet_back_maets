// src/app.js
import express from "express";
import dotenv from "dotenv";

import userRoutes from "./routes/userRoutes.js";
import authRoutes from "./routes/authRoutes.js";
import gameRoutes from "./routes/gameRoutes.js";
import gameConfigRoutes from "./routes/gameConfigRoute.js"; 
import { setupSwagger } from './config/swagger.js'; 
import errorHandler from "./middlewares/errorHandler.js";

dotenv.config();

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true })); 

app.get("/", (req, res) => {
  res.send("Backend Maets fonctionne !");
});

app.use("/api/users", userRoutes);
app.use("/api/auth", authRoutes);
app.use("/api/games", gameRoutes);
app.use("/api/config", gameConfigRoutes);

setupSwagger(app);

app.use(errorHandler);

export default app;
