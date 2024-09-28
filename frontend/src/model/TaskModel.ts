export interface TaskModel {
    id: number;
    title: string;
    description: string;
    status: "pending" | "completed" | "in-progress";
    created_at: Date;
  }
  