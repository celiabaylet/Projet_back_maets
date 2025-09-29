// src/db/mongo.js
import mongoose from 'mongoose';
import { MONGO_URI } from '../config/config.js';

export const connectMongo = async () => {
  try {
    await mongoose.connect(MONGO_URI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log('✅ Connected to MongoDB');
  } catch (err) {
    console.error('❌ MongoDB connection failed:', err);
  }
};
