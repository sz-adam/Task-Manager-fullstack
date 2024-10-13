import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { TextField, Button, Box } from '@mui/material';
import { AppDispatch, RootState } from '../redux/store';
import { fetchTask, searchTasks } from '../redux/TaskSlicer';

const SearchTasks: React.FC = () => {
    const [searchTerm, setSearchTerm] = useState('');
    const dispatch = useDispatch<AppDispatch>();

    // Taskok lekérése 
    const tasks = useSelector((state: RootState) => state.tasks.data);

    const handleSearch = () => {
        if (searchTerm) {
            dispatch(searchTasks(searchTerm));
        } else {
            dispatch(fetchTask());
        }
    };

    return (
        <Box sx={{
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'center',
            alignItems: 'center'
        }}>
            <TextField
                label="Search Tasks"
                variant="outlined"
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                autoComplete='off'
            />
            <Button variant="contained" color="primary" disabled={tasks?.length === 0} onClick={handleSearch} sx={{
                marginTop: 3
            }}>
                Search
            </Button>
        </Box>
    );
};

export default SearchTasks;
