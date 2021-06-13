import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:team_nightingales_app/customs/customRoute.dart';
import 'package:team_nightingales_app/tasks_screen/addtasks.dart';

class TasksPage extends StatefulWidget {
  TasksPage({Key key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Задачи',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.grey.shade600,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey.shade600,
          child: Container(
            child: Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.blueGrey,
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context, MyRoute(builder: (context) => AddTaskPage()));
                  },
                ),
              ),
            ]),
          ),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Tasks').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data.docs.map((document) {
                  return Card(
                    color: Colors.blueGrey[200],
                    elevation: 5,
                    margin: EdgeInsets.all(15),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              document['description'],
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              );
            }));
  }
}
