import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tarefas = ['Estudar', 'ir para academia', 'Jogar'];
  TextEditingController _nomeTarefa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: tarefas.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(tarefas[index]),
                trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        tarefas.removeAt(index);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Tarefa Deletada!!!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }));
          },
        ),
      ),
            bottomNavigationBar: BottomAppBar(
        color: Colors.purpleAccent,
        height: 80,
        shape: CircularNotchedRectangle(),
      ),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Adicionar tarefa'),
                  content: TextField(
                    controller: _nomeTarefa,
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        _nomeTarefa.clear();
                        Navigator.pop(context);
                      },
                      child: Text('Cancelar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          tarefas.add(_nomeTarefa.text);
                          _nomeTarefa.clear();
                        });
                        Navigator.pop(context);
                      },
                      child: Text('Adicionar'),
                    ),
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),

    );
  }
}
