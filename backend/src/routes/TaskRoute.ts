import { Router } from "express";
import { createTask } from "../controllers/TaskController";

const router = Router();

router.post("/tasks",createTask);

export default router;