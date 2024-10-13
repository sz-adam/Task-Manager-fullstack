import { Router } from "express";
import { allTasks, createTask, deleteTask, searchTasks, updateTask } from "../controllers/TaskController";

const router = Router();
//http://localhost:3000/api/tasks
router.post("/tasks",createTask);
//http://localhost:3000/api//alltasks
router.post("/alltasks",allTasks);
http://localhost:3000/api/updatetasks/id
router.put("/updatetasks/:id",updateTask);
http://localhost:3000/api/deletetask/id
router.delete("/deletetask/:id",deleteTask);
//http://localhost:3000/api/searchtasks?title=${title}
router.get("/searchtasks", searchTasks);


export default router;