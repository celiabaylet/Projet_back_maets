// config nosql
import mongoose from "mongoose";

const { Schema, model } = mongoose;

const GameConfigSchema = new Schema({
  gameId: {
    type: Number,
    required: true,
    unique: true,
  },
  settings: {
    type: Object,
    default: {},
  },
  lastUpdated: {
    type: Date,
    default: Date.now,
  },
});

GameConfigSchema.pre("save", function (next) {
  this.lastUpdated = Date.now();
  next();
});

const GameConfig = model("GameConfig", GameConfigSchema);

export default GameConfig;
