import 'package:flutter/material.dart';
import 'package:todo_bloc/modal/add_todo_modal.dart';
import 'package:todo_bloc/screens/favorite.dart';

class ToDoScreen extends StatefulWidget {
  ToDoScreen({super.key, required this.title, required this.object});

  final String title;
  final object;

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FavoriteScreen(
                            title: 'ToDo List',
                            todoBloc: widget.object,
                          )));
            },
            icon: Icon(Icons.route),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<List<AddTodoModal>>(
            stream: widget.object.getStream,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (ctx, index) {
                        return Card(
                          child: ListTile(
                            leading: IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                widget.object.addFavTask(index);
                              },
                            ), //CircleAvatar(child: Text('${index + 1}')),
                            title: Text('${snapshot.data![index].title}'),
                            subtitle:
                                Text('${snapshot.data![index].description}'),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                widget.object.deleteTask(index);
                              },
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
