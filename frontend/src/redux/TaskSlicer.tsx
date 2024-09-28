import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { NewTask, TaskModel } from "../model/TaskModel";

interface TaskState {
  isLoading: boolean;
  data: TaskModel[] | null;
  error: boolean;
}

// initial state
const initialState: TaskState = {
  isLoading: false,
  data: null,
  error: false,
};

// Aszinkron thunk az adatok lekéréséhez
export const fetchTask = createAsyncThunk("fetchTask", async () => {
  const response = await fetch("http://localhost:3000/api/alltasks", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({}),
  });

  if (!response.ok) {
    const errorData = await response.text();
    throw new Error(
      `HTTP error! Status: ${response.status}, Message: ${errorData}`
    );
  }

  return response.json();
});

export const addTask = createAsyncThunk("addTask", async (task: NewTask) => {
  const response = await fetch("http://localhost:3000/api/tasks", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(task),
  });

  if (!response.ok) {
    const errorData = await response.text();
    throw new Error(
      `HTTP error! Status: ${response.status}, Message: ${errorData}`
    );
  }

  return response.json();
});

export const deleteTask = createAsyncThunk(
  "deleteTask",
  async (taskId: string) => {
    const response = await fetch(
      `http://localhost:3000/api/deletetask/${taskId}`,
      {
        method: "DELETE",
      }
    );

    if (!response.ok) {
      throw new Error("Failed to delete the task");
    }

    return taskId;
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
    //0ssyes task lekérése
    builder.addCase(fetchTask.fulfilled, (state, action) => {
      state.isLoading = false;
      state.data = action.payload;
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
  },
});

export default taskSlice.reducer;
