// services/AuthService.js
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { User } from "../models/index.js"; // import nommés depuis index.js

const AuthService = {
  async register({ username, email, password }) {
    const existingUser = await User.findOne({ where: { email } });
    if (existingUser) throw new Error("Un utilisateur avec cet email existe déjà");

    const hashedPassword = await bcrypt.hash(password, 10);
    return await User.create({ username, email, password: hashedPassword });
  },

  async login({ username, password }) {
    const user = await User.findOne({ where: { username } });
    if (!user) throw new Error("Utilisateur non trouvé");

    const isValid = await bcrypt.compare(password, user.password);
    if (!isValid) throw new Error("Mot de passe incorrect");

    const token = jwt.sign(
      { id: user.id, username: user.username },
      process.env.JWT_SECRET || "secretdev", 
      { expiresIn: "1h" }
    );

    return { user, token };
  },
};

export default AuthService;
