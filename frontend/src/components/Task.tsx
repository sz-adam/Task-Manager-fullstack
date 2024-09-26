import { Box, Card, CardContent, Typography } from "@mui/material";
import React from "react";

interface Task {
  title: string;
  description: string;
  status: "pending" | "completed" | "in-progress";
  created_at: Date;
}
//TODO: elrendezésen javítani 
const Task: React.FC<Task> = ({ title, description, status, created_at }) => {
  return (
    <Card sx={{ maxWidth: 345, boxShadow: 3 }}>
    <CardContent>
      <Typography variant="h5" component="div">
        {title}
      </Typography>
      <Typography variant="body2" color="text.secondary">
        {description}
      </Typography>
      <Typography variant="body2" color="text.primary">
        Status: {status}
      </Typography>
      <Typography variant="body2" color="text.secondary">
        Created At: {created_at.toLocaleDateString()} {created_at.toLocaleTimeString()}
      </Typography>
    </CardContent>
  </Card>
  );
};

export default Task;
