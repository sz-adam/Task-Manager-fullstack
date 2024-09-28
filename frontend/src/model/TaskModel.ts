export interface TaskModel {
  id: string;
  title: string;
  description: string;
  status: "pending" | "completed" | "in-progress";
  created_at: Date;
}

export interface NewTask {
  title: string;
  description: string;
}
