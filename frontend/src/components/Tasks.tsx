import React, { useEffect } from "react";
import { Box, Grid, Typography } from "@mui/material";
import Task from "./Task";
import { useDispatch, useSelector } from "react-redux";
import { fetchTask } from "../redux/TaskSlicer";
import { AppDispatch, RootState } from "../redux/store";

const Tasks: React.FC = () => {
  const dispatch: AppDispatch = useDispatch();
  const data = useSelector((state: RootState) => state.tasks);

  useEffect(() => {
    dispatch(fetchTask());
  }, [dispatch]);

  return (
    <div>
      {data.isLoading ? (
        <Typography
          sx={{
            textAlign: "center",
            paddingTop: 15,
            fontSize: 32,
            fontWeight: "bold",
          }}
        >
          Loading...
        </Typography>
      ) : data.data && data.data.length > 0 ? (
        <Box sx={{ flexGrow: 1, padding: 2, marginTop: 2 }}>
          <Grid container spacing={3}>
            {data.data.map((task, index) => (
              <Grid item xs={12} sm={6} md={3} key={index}>
                <Task
                  id={task.id}
                  title={task.title}
                  description={task.description}
                  status={task.status}
                  created_at={task.created_at}
                />
              </Grid>
            ))}
          </Grid>
        </Box>
      ) : (
        <h1>No tasks found</h1>
      )}
    </div>
  );
};

export default Tasks;
