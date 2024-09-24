import { Request, Response } from "express";

import db from "../db/database";
import { Task } from "../models/TaskModel";

//Create Task

export const createTask = (req: Request, res: Response) => {
  const { title, description } = req.body;
  const task = db.prepare("INSERT INTO tasks (title, description) VALUES(?, ?)");
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
