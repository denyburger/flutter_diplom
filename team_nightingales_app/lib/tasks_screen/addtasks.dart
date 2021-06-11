import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  CollectionReference achiev = FirebaseFirestore.instance.collection('Tasks');
  final formKey = GlobalKey<FormState>();

  String adddesciprion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: Text('Добавление задачи'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            TextFormField(
              onChanged: (value) {
                adddesciprion = value;
              },
              decoration: InputDecoration(labelText: 'Описание'),
              validator: (value) {
                return value.isEmpty ? 'Описание не может быть пустым' : null;
              },
              // onSaved: (value) {
              //   return myValue = value;
              // },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            FloatingActionButton.extended(
              splashColor: Colors.deepPurple,
              backgroundColor: Colors.blueGrey,
              label: Text('Сохранить'),
              icon: Icon(Icons.save),
              onPressed: () async {
                await achiev.add({'description': adddesciprion}).then(
                    (value) => showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text('Успешно!'),
                            actions: <Widget>[
                              ElevatedButton(                             
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Ок'))
                            ],
                          );
                        }));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
