import React, { useState } from "react";
import {
  Dialog,
  DialogActions,
  DialogContent,
  DialogContentText,
  DialogTitle,
  Button,
  FormControl,
  InputLabel,
  Input,
} from "@mui/material";

interface TaskDialogProps {
  open: boolean;
  handleClose: () => void;
  handleSubmit: (title: string, description: string) => void;
}

const TaskDialog: React.FC<TaskDialogProps> = ({
  open,
  handleClose,
  handleSubmit,
}) => {
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");

  const onSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    handleSubmit(title, description);
    setTitle("");
    setDescription("");
    handleClose();
  };

  return (
    <Dialog open={open} onClose={handleClose}>
      <DialogTitle>Add a New Task</DialogTitle>
      <DialogContent>
        <DialogContentText>
          Please enter the details for the new task you want to add.
        </DialogContentText>
        {/* Form kezdete */}
        <form onSubmit={onSubmit}>
          <FormControl fullWidth margin="normal">
            <InputLabel htmlFor="task-title">Task Title</InputLabel>
            <Input
              id="task-title"
              aria-describedby="title-helper-text"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
              required
            />
          </FormControl>         
          <FormControl fullWidth margin="normal">
            <InputLabel htmlFor="task-description">Task Description</InputLabel>
            <Input
              id="task-description"
              aria-describedby="description-helper-text"
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              required
              multiline
              rows={4} // Több soros input mező
            />
          </FormControl>
          {/*gombok */}
          <DialogActions>
            <Button onClick={handleClose} color="secondary">
              Cancel
            </Button>
            <Button type="submit" color="primary">
              Add Task
            </Button>
          </DialogActions>
        </form>
      </DialogContent>
    </Dialog>
  );
};

export default TaskDialog;
