export interface Task {
  id: number;
  title: string;
  description: string;
  status: "pendings" | "completed" | "in-progress";
  created_at: Date;
}
