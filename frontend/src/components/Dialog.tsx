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
import { AppDispatch } from "../redux/store";
import { useDispatch } from "react-redux";
import { addTask } from "../redux/TaskSlicer";

interface TaskDialogProps {
  open: boolean;
  handleClose: () => void;
  initialTitle?: string; // Opciós, mivel lehet, hogy új task létrehozásról van szó
  initialDescription?: string;
}

const TaskDialog: React.FC<TaskDialogProps> = ({  open, handleClose, initialTitle = "", initialDescription = "" }) => {
  const [title, setTitle] = useState(initialTitle);
  const [description, setDescription] = useState(initialDescription);
  const dispatch: AppDispatch = useDispatch();

  const onSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    const newTask: { title: string; description: string } = {
      title,
      description,
    };

    // Küldés a Redux thunk segítségével
    dispatch(addTask(newTask));

    setTitle("");
    setDescription("");
    handleClose();
  };

  return (
    <Dialog open={open} onClose={handleClose}>
      <DialogTitle>{initialTitle ? "Edit Task" : "Add a New Task"}</DialogTitle>
      <DialogContent>
        <DialogContentText>
          {initialTitle
            ? "Modify the details for the selected task."
            : "Please enter the details for the new task you want to add."}
        </DialogContentText>
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
              rows={4}
            />
          </FormControl>
          <DialogActions>
            <Button onClick={handleClose} color="secondary">
              Cancel
            </Button>
            <Button type="submit" color="primary">
              {initialTitle ? "Save Changes" : "Add Task"}
            </Button>
          </DialogActions>
        </form>
      </DialogContent>
    </Dialog>
  );
};

export default TaskDialog;
