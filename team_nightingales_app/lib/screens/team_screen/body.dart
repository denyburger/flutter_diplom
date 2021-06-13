import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('Players').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Игроки",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                          ),
                          children: snapshot.data.docs.map((document) {
                            return Container(
                              child: FlipCard(
                                  front: Card(
                                    color: Colors.blueGrey,
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Container(
                                      child: Image.network(document['image']),
                                    ),
                                  ),
                                  back: Card(
                                    color: Colors.blueGrey,
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Container(
                                      margin: EdgeInsets.only(top: 50),
                                        child: Column(
                                      children: [
                                        Text(document['nickname'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25)),
                                        Text(
                                          document['name'],
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          "Возраст: " +
                                              document['age'].toString(),
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          "Страна: " + document['country'],
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          "Позиция: " + document['role'],
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    )),
                                  )),
                            );
                          }).toList()),
                    ),
                  )
                ],
              );
            }));
  }
}
