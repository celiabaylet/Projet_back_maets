// src/db/postgres.js
import { PrismaClient } from '@prisma/client';
import { DATABASE_URL } from '../config/config.js';

const prisma = new PrismaClient({
  datasources: { db: { url: DATABASE_URL } },
});

export default prisma;

export const testPostgres = async () => {
  try {
    await prisma.$connect();
    console.log('✅ Connected to PostgreSQL');
  } catch (err) {
    console.error('❌ PostgreSQL connection failed:', err);
  }
};
