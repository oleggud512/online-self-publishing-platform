import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class Todo {
  int? id;
  String name;
  bool completed;

  Todo({
    required this.name,
    this.completed = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'completed': completed,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      name: json['name'],
      completed: json['completed'],
    );
  }
}

class TodoRepository {
  late final Database _database;

  TodoRepository() {
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    final databaseFactory = databaseFactoryIo;
    _database = await databaseFactory.openDatabase('todo_database.db');
  }

  Future<List<Todo>> getAllTodos({String? name, bool? completed}) async {
    final store = intMapStoreFactory.store('todos');
    final finder = Finder(
      filter: Filter.and([
        if (name != null) Filter.matchesRegExp('name', RegExp(name, caseSensitive: true)),
        if (completed != null) Filter.equals('completed', completed),
      ]),
    );
    final todosSnapshot = await store.find(_database);
    return todosSnapshot.map((snapshot) {
      final todo = Todo.fromJson(snapshot.value);
      todo.id = snapshot.key;
      return todo;
    }).toList();
  }

  Future<int> addNewTodo(Todo todo) async {
    final store = intMapStoreFactory.store('todos');
    final todoJson = todo.toJson();
    return await store.add(_database, todoJson);
  }

  Future<void> updateTodo(Todo todo) async {
    final store = intMapStoreFactory.store('todos');
    final todoJson = todo.toJson();
    await store.record(todo.id!).update(_database, todoJson);
  }

  Future<void> deleteTodoById(int id) async {
    final store = intMapStoreFactory.store('todos');
    await store.record(id).delete(_database);
  }
}
