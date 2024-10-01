import { Box } from "@mui/material";
import ModeEditIcon from "@mui/icons-material/ModeEdit";
import DeleteForeverIcon from "@mui/icons-material/DeleteForever";
import DoneIcon from "@mui/icons-material/Done";
import { useDispatch } from "react-redux";
import { deleteTask } from "../redux/TaskSlicer";
import { AppDispatch } from "../redux/store";
import { useState } from "react";
import TaskDialog from "./Dialog";

interface TaskCardIconProps {
  id: string;
  title: string;
  description: string
}

const TaskCardIcon: React.FC<TaskCardIconProps> = ({ id, title, description }) => {
  const [isEditDialogOpen, setEditDialogOpen] = useState(false);

  const dispatch: AppDispatch = useDispatch();

  const handleDelete = () => {
    dispatch(deleteTask(id)); // Task törlése
  };

  return (
    <>
      <Box sx={{ marginTop: "auto" }}>
        <ModeEditIcon
          sx={{ marginRight: 1, cursor: "pointer" }}
          onClick={() => setEditDialogOpen(true)} 
        />
        <DeleteForeverIcon
          onClick={handleDelete}
          sx={{ marginLeft: 1, marginRight: 1, cursor: "pointer" }}
        />
        <DoneIcon sx={{ marginLeft: 1, cursor: "pointer" }} />
      </Box>

      {/* Szerkesztő Dialog megnyitása, adatokkal előtöltve */}
      <TaskDialog
        open={isEditDialogOpen}
        handleClose={() => setEditDialogOpen(false)}
        initialTitle={title} // Task címének átadása
        initialDescription={description} // Task leírásának átadása
      />
    </>
  );
};

export default TaskCardIcon;
