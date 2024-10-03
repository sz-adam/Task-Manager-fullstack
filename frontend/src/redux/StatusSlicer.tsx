import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";

// Kezdeti állapot
const initialState = {
    statusOptions: [] as string[],
    loading: false,
    error: null as string | null,
};

// Aszinkron thunk az API híváshoz
export const fetchStatuses = createAsyncThunk<string[], void>(
    "fetchStatuses",
    async () => {
        const response = await axios.get("http://localhost:3000/api/allstatus");
        return response.data;
    }
);

// Aszinkron thunk a státusz frissítésére
export const updateStatus = createAsyncThunk<void, { id: string; status: string }>(
    "updateStatus",
    async ({ id, status }) => {
        await axios.put(`http://localhost:3000/api/updatestatus/${id}`, { status });
    }
);


const statusesSlice = createSlice({
    name: "statuses",
    initialState,
    reducers: {},
    extraReducers: (builder) => {
        //full status
        builder.addCase(fetchStatuses.pending, (state) => {
            state.loading = true;
            state.error = null;
        });
        builder.addCase(fetchStatuses.fulfilled, (state, action) => {
            state.statusOptions = action.payload;
            state.loading = false;
        });
        builder.addCase(fetchStatuses.rejected, (state, action) => {
            state.loading = false;
            state.error = action.error.message || "Failed to load statuses";
        });

        //update status         
        builder.addCase(updateStatus.pending, (state) => {
            state.loading = true;
            state.error = null;
        });
        builder.addCase(updateStatus.fulfilled, (state) => {
            state.loading = false;
        });
        builder.addCase(updateStatus.rejected, (state, action) => {
            state.loading = false;
            state.error = action.error.message || "Failed to update status";
        });
    },
});

export default statusesSlice.reducer;
