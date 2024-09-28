import { Box } from "@mui/material";
import ModeEditIcon from "@mui/icons-material/ModeEdit";
import DeleteForeverIcon from "@mui/icons-material/DeleteForever";
import DoneIcon from "@mui/icons-material/Done";
import { useDispatch } from "react-redux";
import { deleteTask } from "../redux/TaskSlicer";
import { AppDispatch } from "../redux/store";

interface TaskCardIconProps {
  id: string;
}

const TaskCardIcon: React.FC<TaskCardIconProps> = ({ id }) => {
  const dispatch: AppDispatch = useDispatch();

  const handleDelete = () => {
    dispatch(deleteTask(id)); // Task törlése
  };

  return (
    <Box sx={{ marginTop: "auto" }}>
      <ModeEditIcon sx={{ marginRight: 1, cursor: "pointer" }} />
      <DeleteForeverIcon
        onClick={handleDelete}
        sx={{ marginLeft: 1, marginRight: 1, cursor: "pointer" }}
      />
      <DoneIcon sx={{ marginLeft: 1, cursor: "pointer" }} />
    </Box>
  );
};

export default TaskCardIcon;
