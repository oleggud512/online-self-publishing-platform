import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class Node {
  int? id;
  String name;
  bool completed;
  List<Node>? children;

  Node({
    required this.name,
    this.completed = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'completed': completed,
    };
  }

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      name: json['name'],
      completed: json['completed'],
    );
  }
}

class NodeRepository {
  late final Database _database;
  final store = intMapStoreFactory.store('nodes');


  NodeRepository() {
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    final databaseFactory = databaseFactoryIo;
    _database = await databaseFactory.openDatabase('todo_database.db');
  }

  a() {
    _database.transaction((tnx) async {
      final top = await store.find(tnx);
      
    });
  }

  Future<List<Node>> getAllTodos({String? name, bool? completed}) async {
    final store = intMapStoreFactory.store('todos');
    final finder = Finder(
      filter: Filter.and([
        if (name != null) Filter.matchesRegExp('name', RegExp(name, caseSensitive: true)),
        if (completed != null) Filter.equals('completed', completed),
      ]),
    );
    final todosSnapshot = await store.find(_database);
    return todosSnapshot.map((snapshot) {
      final todo = Node.fromJson(snapshot.value);
      todo.id = snapshot.key;
      return todo;
    }).toList();
  }

  Future<int> addNewTodo(Node todo) async {
    final store = intMapStoreFactory.store('todos');
    final todoJson = todo.toJson();
    return await store.add(_database, todoJson);
  }

  Future<void> updateTodo(Node todo) async {
    final store = intMapStoreFactory.store('todos');
    final todoJson = todo.toJson();
    await store.record(todo.id!).update(_database, todoJson);
  }

  Future<void> deleteTodoById(int id) async {
    final store = intMapStoreFactory.store('todos');
    await store.record(id).delete(_database);
  }
}
