import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";

interface TaskState {
  isLoading: boolean;
  date: any | null; 
  error: boolean;
}

// initial state
const initialState: TaskState = {
  isLoading: false,
  date: null,
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
      // Ha a válasz nem megfelelő
      const errorData = await response.text();
      throw new Error(`HTTP error! Status: ${response.status}, Message: ${errorData}`);
    }
  
    return response.json();
  });
  

const taskSlice = createSlice({
  name: "tasks",
  initialState,
  reducers: {},
  extraReducers: (builder) => {
    builder.addCase(fetchTask.pending, (state) => {
      state.isLoading = true;
      state.error = false;
    });
    builder.addCase(fetchTask.fulfilled, (state, action) => {
      state.isLoading = false;
      state.date = action.payload;
    });
    builder.addCase(fetchTask.rejected, (state) => {
      state.isLoading = false;
      state.error = true;
    });
  },
});

export default taskSlice.reducer;
