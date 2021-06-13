import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AchievPage extends StatelessWidget {
  AchievPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Achievments')
                .snapshots(),
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    elevation: 5,
                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(15),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.17,
                                    child: Image.network(
                                      document['image'],
                                      fit: BoxFit.fill,
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  document['name'],
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(document['year']),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                Text(document['place']),
                              ],
                            ),
                          ],
                        ),
                        ExpansionTile(
                          tilePadding: EdgeInsets.all(3),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                child: Column(
                                  children: [
                                    Text(
                                      document['description'],
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Выиграно: " +
                                        document['prize'].toString() +
                                        " \$",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Получено: " +
                                        document['points'].toString() +
                                        " DPC-очков",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                          title: Text('Подробнее'),
                        )
                      ],
                    ),
                  );
                }).toList(),
              );
            }));
  }
}
