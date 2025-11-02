import dotenv from 'dotenv';
dotenv.config(); 

export const DATABASE_URL = process.env.DATABASE_URL;
export const MONGO_URI = process.env.MONGO_URI;
export const PORT = process.env.PORT || 3000;
