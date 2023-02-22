import 'package:flutter/material.dart';
import 'package:todo_bloc/modal/add_todo_modal.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen(
      {super.key, required this.todoBloc, required this.title});
  final todoBloc;
  final String title;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<AddTodoModal>>(
              stream: widget.todoBloc.getFavStream,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (ctx, index) {
                          return Card(
                            child: ListTile(
                              leading:
                                  CircleAvatar(child: Text('${index + 1}')),
                              title: Text('${snapshot.data![index].title}'),
                              subtitle:
                                  Text('${snapshot.data![index].description}'),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
