

class Todo {
  final String id;
  final String title;
  final String description;
  bool isCompleted;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.isCompleted = false
  });
}

final List<Todo> dummyTodos = [
  Todo(
    id: '1',
    title: 'Buy groceries',
    description: 'Milk, Eggs, Bread, Fruits',
    isCompleted: false,
    createdAt: DateTime.parse('2025-05-15 09:00:00'),
  ),
  Todo(
    id: '2',
    title: 'Morning workout',
    description: '30 mins of cardio and stretching',
    createdAt: DateTime.parse('2025-05-15 06:30:00'),
    isCompleted: true,
  ),
  Todo(
    id: '3',
    title: 'Call mom',
    description: 'Check in and ask about her week',
    isCompleted: false,
    createdAt: DateTime.parse('2025-05-14 18:00:00'),
  ),
  Todo(
    id: '4',
    title: 'Finish Flutter BLoC tutorial',
    description: 'Complete the to-do app step',
    isCompleted: false,
    createdAt: DateTime.parse('2025-05-13 16:45:00'),
  ),
  Todo(
    id: '5',
    title: 'Reply to emails',
    description: 'Respond to project and meeting follow-ups',
    createdAt: DateTime.parse('2025-05-15 10:15:00'),
    isCompleted: true,
  ),
  Todo(
    id: '6',
    title: 'Book dentist appointment',
    description: 'Routine check-up next week',
    isCompleted: false,
    createdAt: DateTime.parse('2025-05-14 11:00:00'),
  ),
  Todo(
    id: '7',
    title: 'Read a chapter of a book',
    description: 'From Atomic Habits',
    createdAt: DateTime.parse('2025-05-13 20:00:00'),
    isCompleted: false,
  ),
  Todo(
    id: '8',
    title: 'Team stand-up meeting',
    description: 'Daily sync with dev team',
    createdAt: DateTime.parse('2025-05-15 09:30:00'),
    isCompleted: true,
  ),
  Todo(
    id: '9',
    title: 'Organize workspace',
    description: 'Clean desk and sort documents',
    createdAt: DateTime.parse('2025-05-14 15:30:00'),
    isCompleted: false,
  ),
  Todo(
    id: '10',
    title: 'Plan weekend trip',
    description: 'Look up hiking spots and book a hotel',
    createdAt: DateTime.parse('2025-05-12 21:00:00'),
    isCompleted: false,
  ),
];