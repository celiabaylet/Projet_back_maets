// src/models/mongoose.js
import mongoose from "mongoose";

mongoose
  .connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => console.log("MongoDB connectée"))
  .catch((err) => console.error("Erreur MongoDB :", err));

export default mongoose;
