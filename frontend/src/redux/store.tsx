import { configureStore } from "@reduxjs/toolkit";
import taskReducer from "./TaskSlicer";
import statusReducer from "./StatusSlicer";

export const store = configureStore({
  reducer: {
    tasks: taskReducer,
    status: statusReducer,
  },
});


export type AppDispatch = typeof store.dispatch;
export type RootState = ReturnType<typeof store.getState>;