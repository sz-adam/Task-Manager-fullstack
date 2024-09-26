import { Box, Button, Typography } from "@mui/material";
import AddIcon from "@mui/icons-material/Add";

function Header() {
  return (
    <Box
      display="flex"
      justifyContent="space-between"
      alignItems="center"
      p="2"
    >
      <Box position="relative" display="inline-block">
        <Typography variant="h4" color="textPrimary" fontWeight="bold">
          Task Manager
        </Typography>
        <Box
          position="absolute"
          bottom={-2}
          left={0}
          width="40%"
          height="2px"
          bgcolor="blue"
        />
      </Box>
      {/**sx formázásra add lehetőséget  */}
      <Button
        variant="contained"
        color="primary"
        sx={{
          display: "flex",
          alignItems: "center",
          gap: 1,
          padding: "8px 16px",
        }}
      >
        <AddIcon className="animated-icon" /> Add Task
      </Button>
    </Box>
  );
}

export default Header;
