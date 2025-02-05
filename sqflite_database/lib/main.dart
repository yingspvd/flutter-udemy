import 'package:flutter/material.dart';

import 'database_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final data = await dbHelper.getUsers();
    setState(() {
      users = data;
    });
  }

  Future<void> addUser() async {
    await dbHelper.insertUser({'name': 'John Doe', 'age': 25});
    fetchUsers();
  }

  Future<void> updateUser(int id) async {
    await dbHelper.updateUser(id, {'name': 'Updated Name', 'age': 30});
    fetchUsers();
  }

  Future<void> deleteUser(int id) async {
    await dbHelper.deleteUser(id);
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('SQLite in Flutter')),
        body: Column(
          children: [
            ElevatedButton(onPressed: addUser, child: Text("Add User")),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(user['name']),
                    subtitle: Text('Age: ${user['age']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => updateUser(user['id']),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => deleteUser(user['id']),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
