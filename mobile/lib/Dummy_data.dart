class TaskData {
  final int id;
  final String title;
  final String description;
  final String status;
  final DateTime createdAt;

  TaskData({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
  });
}

List<TaskData> dummyTasks = [
  TaskData(
    id: 1,
    title: "Task 1",
    description: "Description for Task 1",
    status: "pending",
    createdAt: DateTime.now().subtract(Duration(days: 1)), // Tegnap
  ),
  TaskData(
    id: 2,
    title: "Task 2",
    description: "Description for Task 2",
    status: "completed",
    createdAt: DateTime.now().subtract(Duration(days: 2)), // Két nappal ezelőtt
  ),
  TaskData(
    id: 3,
    title: "Task 3",
    description: "Description for Task 3",
    status: "in-progress",
    createdAt: DateTime.now(), // Ma
  ),
  TaskData(
    id: 4,
    title: "Task 4",
    description: "Description for Task 4",
    status: "pending",
    createdAt:
        DateTime.now().subtract(Duration(days: 3)), // Három nappal ezelőtt
  ),
  TaskData(
    id: 5,
    title: "Task 5",
    description: "Description for Task 5",
    status: "completed",
    createdAt: DateTime.now().subtract(Duration(days: 5)), // Öt nappal ezelőtt
  ),
  TaskData(
    id: 6,
    title: "Task 1",
    description: "Description for Task 1",
    status: "pending",
    createdAt: DateTime.now().subtract(Duration(days: 1)), // Tegnap
  ),
  TaskData(
    id: 7,
    title: "Task 2",
    description: "Description for Task 2",
    status: "completed",
    createdAt: DateTime.now().subtract(Duration(days: 2)), // Két nappal ezelőtt
  ),
  TaskData(
    id: 7,
    title: "Task 3",
    description: "Description for Task 3",
    status: "in-progress",
    createdAt: DateTime.now(), // Ma
  ),
  TaskData(
    id: 8,
    title: "Task 4",
    description: "Description for Task 4",
    status: "pending",
    createdAt:
        DateTime.now().subtract(Duration(days: 3)), // Három nappal ezelőtt
  ),
  TaskData(
    id: 9,
    title: "Task 5",
    description: "Description for Task 5",
    status: "completed",
    createdAt: DateTime.now().subtract(Duration(days: 5)), // Öt nappal ezelőtt
  ),
  TaskData(
    id: 11,
    title: "Task 1",
    description: "Description for Task 1",
    status: "pending",
    createdAt: DateTime.now().subtract(Duration(days: 1)), // Tegnap
  ),
  TaskData(
    id: 12,
    title: "Task 2",
    description: "Description for Task 2",
    status: "completed",
    createdAt: DateTime.now().subtract(Duration(days: 2)), // Két nappal ezelőtt
  ),
  TaskData(
    id: 13,
    title: "Task 3",
    description: "Description for Task 3",
    status: "in-progress",
    createdAt: DateTime.now(), // Ma
  ),
  TaskData(
    id: 14,
    title: "Task 4",
    description: "Description for Task 4",
    status: "pending",
    createdAt:
        DateTime.now().subtract(Duration(days: 3)), // Három nappal ezelőtt
  ),
  TaskData(
    id: 15,
    title: "Task 5",
    description: "Description for Task 5",
    status: "completed",
    createdAt: DateTime.now().subtract(Duration(days: 5)), // Öt nappal ezelőtt
  ),
];
