import React, { useEffect } from "react";
import { Box, Grid, Typography } from "@mui/material";
import Task from "./Task";
import { useDispatch, useSelector } from "react-redux";
import { fetchTask } from "../redux/TaskSlicer";
import { AppDispatch, RootState } from "../redux/store";
import SearchTasks from "./Search";

const Tasks: React.FC = () => {
  const dispatch: AppDispatch = useDispatch();
  const { data, searchResults, isLoading } = useSelector((state: RootState) => state.tasks);

  useEffect(() => {
    dispatch(fetchTask());
  }, [dispatch]);

  // Keresési eredmények vagy az összes feladat megjelenítése
  const tasksToDisplay = searchResults || data;

  const sortedTasks = tasksToDisplay
    ? [...tasksToDisplay].sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime())
    : [];

  return (
    <div>
      <SearchTasks />
      {isLoading ? (
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
      ) : sortedTasks && sortedTasks.length > 0 ? (
        <Box sx={{ flexGrow: 1, padding: 2, marginTop: 2 }}>
          <Grid container spacing={3}>
            {sortedTasks.map((task, index) => (
              <Grid item xs={12} sm={6} md={3} key={index}>
                <Task
                  task={task}
                />
              </Grid>
            ))}
          </Grid>
        </Box>
      ) : (
        <Typography sx={{
          textAlign: 'center', fontSize: 24, marginTop: 5
        }}>There are currently no tasks!!</Typography>
      )}
    </div>
  );
};

export default Tasks;
