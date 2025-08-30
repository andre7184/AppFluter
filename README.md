
# 📱 AppFlutter - Aplicativo Flutter de Gerenciamento de Tarefas

---

## ⚙️ 1. Instalação do Ambiente Flutter
**Objetivo:** Preparar o ambiente de desenvolvimento Flutter.

**Passos:**
- Instalar o Flutter SDK: [Guia oficial](https://docs.flutter.dev/get-started/install)
- Configurar o PATH do Flutter.
- Verificar a instalação com `flutter doctor`.
- Instalar um editor (VS Code ou Android Studio).
- Criar e executar o projeto:
```bash
flutter create taskflow
cd taskflow
flutter run
```

---

## 📂 2. Estrutura Inicial do Projeto
**Objetivo:** Organizar o projeto de forma modular.

**Estrutura sugerida:**
```
lib/
├── models/
├── services/
├── pages/
├── widgets/
└── main.dart
```

---

## 📦 3. Modelo de Tarefa
**Objetivo:** Representar uma tarefa com atributos e métodos.

**Características:**
- Atributos: `id`, `title`, `description`, `isCompleted`
- Métodos:
  - `toggleCompleted()` – alterna o status da tarefa
  - `toJson()` / `fromJson()` – serialização para persistência

---

## 🧠 4. Serviço de Tarefas
**Objetivo:** Gerenciar tarefas e persistência local.

**Funções principais:**
- `loadTasks()` – carrega tarefas salvas
- `saveTasks()` – salva tarefas no dispositivo
- `addTask()`, `removeTask()`, `updateTask()`, `toggleTaskStatus()` – operações CRUD

**Tecnologia usada:** `SharedPreferences`

---

## 📋 5. Página de Lista de Tarefas
**Objetivo:** Exibir todas as tarefas com opções de edição e exclusão.

**Arquivo:** `pages/task_list_page.dart`

---

## 📝 6. Página de Adição de Tarefa
**Objetivo:** Criar nova tarefa via formulário.

**Arquivo:** `pages/add_task_page.dart`

---

## ✏️ 7. Página de Edição de Tarefa
**Objetivo:** Editar tarefa existente via formulário.

**Arquivo:** `pages/edit_task_page.dart`

---

## 💾 8. Persistência com SharedPreferences
**Objetivo:** Salvar dados localmente no dispositivo.

**Configuração:**
- Adicionar ao `pubspec.yaml`:
```yaml
dependencies:
  shared_preferences: ^2.2.2
```
- Inicializar no `main.dart`:
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final taskService = TaskService();
  await taskService.loadTasks();
  runApp(TaskFlowApp(taskService: taskService));
}
```

---

## ✅ 9. Conclusão
**Resultado:** App funcional com:
- Interface organizada
- Persistência local
- Estrutura modular e boas práticas

**Sugestões de melhorias:**
- Filtros por status
- Animações
- Tema escuro
- Integração com Firebase
