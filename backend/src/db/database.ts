import Database from "better-sqlite3";

const db = new Database("task.db");

// tábla létrehozása ha még nem létezik

const createTable = `
CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'completed', 'in-progress')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)`;

db.exec(createTable);

export default db;
