import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { NewTask, TaskModel } from "../model/TaskModel";
import axios from "axios";


interface TaskState {
  isLoading: boolean;
  data: TaskModel[] | null;
  error: boolean;
  searchResults: TaskModel[] | null;
}

// initial state
const initialState: TaskState = {
  isLoading: false,
  data: null,
  error: false,
  searchResults: null,
};

// Aszinkron thunk az adatok lekéréséhez
// összes task
export const fetchTask = createAsyncThunk("fetchTask", async () => {
  const response = await axios.post("http://localhost:3000/api/alltasks", {});
  return response.data;
});
//create task
export const addTask = createAsyncThunk("addTask", async (task: NewTask) => {
  const response = await axios.post("http://localhost:3000/api/tasks", task);
  return response.data;
});
//delete task
export const deleteTask = createAsyncThunk("deleteTask", async (taskId: string) => {
  await axios.delete(`http://localhost:3000/api/deletetask/${taskId}`);
  return taskId;
});

//update task
export const updateTask = createAsyncThunk("updateTask", async (task: TaskModel) => {
  const response = await axios.put(`http://localhost:3000/api/updatetasks/${task.id}`, {
    title: task.title,
    description: task.description,
    status: task.status,
    created_at: task.created_at
  });
  return response.data;
});

//Search
export const searchTasks = createAsyncThunk(
  "searchTasks",
  async (title: string) => {
    const response = await axios.get(`http://localhost:3000/api/searchtasks?title=${title}`);
    return response.data;
  }
);



const taskSlice = createSlice({
  name: "tasks",
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder.addCase(fetchTask.pending, (state) => {
      state.isLoading = true;
      state.error = false;
    });
    //összes task lekérése
    builder.addCase(fetchTask.fulfilled, (state, action) => {
      state.isLoading = false;
      state.data = action.payload;
      state.searchResults = null; 
    });
    builder.addCase(fetchTask.rejected, (state) => {
      state.isLoading = false;
      state.error = true;
    });
    // Új feladat hozzáadása
    builder.addCase(addTask.pending, (state) => {
      state.isLoading = true;
    });
    builder.addCase(addTask.fulfilled, (state, action) => {
      state.isLoading = false;
      if (state.data) {
        state.data.push(action.payload);
      }
    });
    builder.addCase(addTask.rejected, (state) => {
      state.isLoading = false;
      state.error = true;
    });

    // Task törlés kezelése
    builder.addCase(deleteTask.fulfilled, (state, action) => {
      if (state.data) {
        state.data = state.data.filter((task) => task.id !== action.payload);
      }
    });
    builder.addCase(deleteTask.rejected, (state) => {
      state.error = true;
    });


    // Task modosítása kezelése
    builder.addCase(updateTask.fulfilled, (state, action) => {
      if (state.data) {
        const index = state.data.findIndex((task) => task.id === action.payload.id);
        if (index !== -1) {
          // Frissítsük az adott taskot, a status-t és a created_at mező kivételével
          state.data[index] = {
            ...state.data[index],
            title: action.payload.title,
            description: action.payload.description,
            status: action.payload.status,
            created_at: action.payload.created_at,
          };
        }
      }
    });

    // Keresési thunk kezelése
    builder.addCase(searchTasks.pending, (state) => {
      state.isLoading = true;
      state.error = false;
    });
    builder.addCase(searchTasks.fulfilled, (state, action) => {
      state.isLoading = false;
      state.searchResults = action.payload;
    });
    builder.addCase(searchTasks.rejected, (state) => {
      state.isLoading = false;
      state.error = true;
    });
  },
});

export default taskSlice.reducer;
