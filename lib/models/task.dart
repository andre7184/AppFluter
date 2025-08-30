class Task {
  String id; // Identificador único da tarefa
  String title; // Título da tarefa
  String description; // Descrição detalhada
  bool isCompleted; // Status: true = concluída, false = pendente

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false, // Por padrão, a tarefa começa como pendente
  });

  // Método para alternar o status da tarefa
  void toggleCompleted() {
    isCompleted = !isCompleted;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'isCompleted': isCompleted,
  };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    isCompleted: json['isCompleted'],
  );
}
