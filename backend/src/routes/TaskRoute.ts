import { Router } from "express";
import { allTasks, createTask, updateTask } from "../controllers/TaskController";

const router = Router();

router.post("/tasks",createTask);
router.post("/alltasks",allTasks);
router.put("/updatetasks/:id",updateTask);

export default router;