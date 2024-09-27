import { Box, Card, CardContent, Typography } from "@mui/material";
import React from "react";
import ModeEditIcon from "@mui/icons-material/ModeEdit";
import DeleteForeverIcon from "@mui/icons-material/DeleteForever";

interface Task {
  title: string;
  description: string;
  status: "pending" | "completed" | "in-progress";
  created_at: Date;
}
//TODO: elrendezésen javítani
const Task: React.FC<Task> = ({ title, description, status, created_at }) => {
  return (
    <Card sx={{ maxWidth: 400, boxShadow: 3 }}>
      <CardContent>
        <Box display="flex" justifyContent="end" alignItems="end">
          <Box sx={{ textAlign: "center" }}>
            <Typography variant="body2" color="text.secondary">
              {created_at.toLocaleDateString()}{" "}
            </Typography>
            <Typography variant="body2" color="text.secondary">
              {created_at.toLocaleTimeString()}
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
          <Box sx={{ marginTop: "auto" }}>
            <ModeEditIcon sx={{ marginRight: 1, cursor: "pointer" }} />
            <DeleteForeverIcon sx={{ marginLeft: 1, cursor: "pointer" }} />
          </Box>
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
