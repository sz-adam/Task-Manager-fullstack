import { Box, Card, CardContent, Typography } from "@mui/material";
import React from "react";
import TaskCardIcon from "./TaskCardIcon";
import { TaskModel } from "../model/TaskModel";

interface Task {
  task: TaskModel
}

const Task: React.FC<Task> = ({task}) => {
  return (
    <Card sx={{
      maxWidth: 400, boxShadow: 3, backgroundColor: task.status === "completed" ? "success.light" : task.status === "in-progress" ? "warning.light"
        : "error.light"
    }} >
      <CardContent>
        <Box display="flex" justifyContent="end" alignItems="end">
          <Box sx={{ textAlign: "center" }}>
            <Typography variant="body2" color="text.secondary">
              {new Date(task.created_at).toLocaleDateString()}{" "}
            </Typography>
            <Typography variant="body2" color="text.secondary">
              {new Date(task.created_at).toLocaleTimeString()}
            </Typography>
          </Box>
        </Box>
        <Typography variant="h5" component="div">
          {task.title}
        </Typography>
        <Typography variant="body2" color="text.secondary">
          {task.description}
        </Typography>
        <Box display="flex" justifyContent="space-between">
          <TaskCardIcon id={task.id} title={task.title} description={task.description} />
          <Box textAlign="center">
            {" "}
            <Typography variant="body2" color="text.secondary">
              Status:
            </Typography>
            <Typography>{task.status}</Typography>
          </Box>
        </Box>
      </CardContent>
    </Card>
  );
};

export default Task;
