// src/models/mongoose.js
const mongoose = require("mongoose");

mongoose.connect(process.env.MONGO_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true
})
.then(() => console.log("MongoDB connectée"))
.catch(err => console.error("Erreur MongoDB:", err));

module.exports = mongoose;
