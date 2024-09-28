import { configureStore } from "@reduxjs/toolkit";
import taskReducer from "./TaskSlicer";

export const store = configureStore({
  reducer: {
    tasks: taskReducer,
  },
});


export type AppDispatch = typeof store.dispatch;
export type RootState = ReturnType<typeof store.getState>;