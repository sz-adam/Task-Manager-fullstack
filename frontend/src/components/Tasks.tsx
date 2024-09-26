import React from 'react';
import { Box, Grid } from '@mui/material';
import Task from './Task';

const Tasks: React.FC = () => {
  const tasks: Task[] = [
    {
      title: 'Task 1',
      description: 'Description for task 1',
      status: 'pending',
      created_at: new Date('2024-09-01T12:00:00Z')
    },
    {
      title: 'Task 2',
      description: 'Description for task 2',
      status: 'completed',
      created_at: new Date('2024-09-10T09:30:00Z')
    },
    {
      title: 'Task 2',
      description: 'Description for task 2',
      status: 'completed',
      created_at: new Date('2024-09-10T09:30:00Z')
    },
    {
      title: 'Task 2',
      description: 'Description for task 2',
      status: 'completed',
      created_at: new Date('2024-09-10T09:30:00Z')
    },
    {
      title: 'Task 2',
      description: 'Description for task 2',
      status: 'completed',
      created_at: new Date('2024-09-10T09:30:00Z')
    },
    {
      title: 'Task 3',
      description: 'Description for task 3',
      status: 'in-progress',
      created_at: new Date('2024-09-15T15:45:00Z')
    }
  ];

  return (
    <Box sx={{ flexGrow: 1, padding: 2, marginTop:2 }}>
      <Grid container spacing={3}>
        {tasks.map((task, index) => (
          <Grid item xs={12} sm={6} md={3} key={index}>
            <Task
              title={task.title}
              description={task.description}
              status={task.status}
              created_at={task.created_at}
            />
          </Grid>
        ))}
      </Grid>
    </Box>
  );
};

export default Tasks;
