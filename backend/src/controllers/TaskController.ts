import { Request, Response } from "express";

import db from "../db/database";
import { Task } from "../models/TaskModel";

//Create Task

export const createTask = (req: Request, res: Response) => {
  const { title, description } = req.body;
  const task = db.prepare(
    "INSERT INTO tasks (title, description) VALUES(?, ?)"
  );
  const info = task.run(title, description);
  const createTask: Task = {
    id: Number(info.lastInsertRowid), //utolsó sor id-a
    title,
    description,
    status: "pending",
    created_at: new Date(),
  };
  res.status(201).json(createTask);
};

//Read all Tasks
export const allTasks = (req: Request, res: Response) => {
  const allTask = db.prepare("SELECT * FROM tasks");
  const tasks = allTask.all() as Task[];
  res.json(tasks);
};

//Update Task
export const updateTask = (req: Request, res: Response) => {
  const { id } = req.params;
  //lekérjük a feladat új adatait
  const { title, description, status, created_at } = req.body;
  //frissíti a "tasks" táblában a megadott id-hoz tartozó feladatot
  const updateTask = db.prepare(
    "UPDATE tasks SET title =? , description =? ,status =?, created_at =? WHERE id = ? "
  );
  // A run() metódus végrehajtja az SQL utasítást, és az eredményt a "result" változóba mentjük
  const result = updateTask.run(title, description, status, created_at, Number(id)); // id-t számmá konvertáljuk
  // Ellenőrizzük, hogy történt-e változtatás az adatbázisban
  if (result.changes > 0) {
    const updatedTask: Task = {
      id: Number(id), // id-t számmá konvertáljuk
      title,
      description,
      status,
      created_at
    };
    res.json(updatedTask);
  } else {
    res.status(404).json({ message: "Task not found" });
  }
};

//Delete task
export const deleteTask = (req: Request, res: Response) => {
  //lekérjük a feladat új adatait
  const { id } = req.params;
  //frissíti a "tasks" táblában a megadott id-hoz tartozó feladatot
  const deleteTask = db.prepare("Delete FROM tasks WHERE id =?");
  // A run() metódus végrehajtja az SQL utasítást, és az eredményt a "result" változóba mentjük
  const result = deleteTask.run(Number(id));
  if (result.changes > 0) {
    //sikeres tötlés
    res.status(200).json({ message: "Task deleted successfully" });
  } else {
    //ha nem található task
    res.status(404).json({ message: "Task not found" });
  }
};
