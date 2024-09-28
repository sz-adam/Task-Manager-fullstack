import { Box } from "@mui/material";
import ModeEditIcon from "@mui/icons-material/ModeEdit";
import DeleteForeverIcon from "@mui/icons-material/DeleteForever";
import DoneIcon from "@mui/icons-material/Done";

function TaskCardIcon() {
  return (
    <Box sx={{ marginTop: "auto" }}>
      <ModeEditIcon sx={{ marginRight: 1, cursor: "pointer" }} />
      <DeleteForeverIcon
        sx={{ marginLeft: 1, marginRight: 1, cursor: "pointer" }}
      />
      <DoneIcon sx={{ marginLeft: 1, cursor: "pointer" }} />
    </Box>
  );
}

export default TaskCardIcon;
