import { Box, Card, CardContent, Typography } from "@mui/material";
import React from "react";
import TaskCardIcon from "./TaskCardIcon";

interface Task {
  id: string;
  title: string;
  description: string;
  status: "pending" | "completed" | "in-progress";
  created_at: Date;
}

const Task: React.FC<Task> = ({
  title,
  description,
  status,
  created_at,
  id,
}) => {
  return (
    <Card sx={{ maxWidth: 400, boxShadow: 3 }}>
      <CardContent>
        <Box display="flex" justifyContent="end" alignItems="end">
          <Box sx={{ textAlign: "center" }}>
            <Typography variant="body2" color="text.secondary">
              {new Date(created_at).toLocaleDateString()}{" "}
            </Typography>
            <Typography variant="body2" color="text.secondary">
              {new Date(created_at).toLocaleTimeString()}
            </Typography>
          </Box>
        </Box>
        <Typography variant="h5" component="div">
          {title}
        </Typography>
        <Typography variant="body2" color="text.secondary">
          {description}
        </Typography>
        <Box display="flex" justifyContent="space-between">
          <TaskCardIcon id={id} title={title} description={description} />
          <Box textAlign="center">
            {" "}
            <Typography variant="body2" color="text.secondary">
              Status:
            </Typography>
            <Typography>{status}</Typography>
          </Box>
        </Box>
      </CardContent>
    </Card>
  );
};

export default Task;
