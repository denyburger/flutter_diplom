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
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                                margin: EdgeInsets.all(20),
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.17,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Text(document['place']),
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              );
            }));

    // Query ach = FirebaseFirestore.instance
    //     .collection('Achievments')
    //     .orderBy('id', descending: true);
    // return StreamBuilder<QuerySnapshot>(
    //   stream: ach.snapshots(),
    //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //     if (snapshot.hasError) {
    //       return Text('Пожалуйста, подождите...');
    //     }
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey[400]),
    //         ),
    //       );
    //     }

    //     return new NestedScrollView(
    //       headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
    //         return <Widget>[
    //           SliverAppBar(
    //             snap: true,
    //             floating: true,
    //             backgroundColor: Colors.transparent,
    //             automaticallyImplyLeading: false,
    //             elevation: 0,
    //             flexibleSpace: FlexibleSpaceBar(
    //               titlePadding: EdgeInsets.all(1),
    //               centerTitle: true,
    //               collapseMode: CollapseMode.pin,
    //               title: ClipRRect(
    //                 borderRadius: BorderRadius.all(Radius.circular(20)),
    //                 child: Container(
    //                   color: Colors.blueGrey[400],
    //                   padding:
    //                       EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //                   child: Text(
    //                     'Достижения',
    //                     style: TextStyle(color: Colors.white70),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ];
    //       },
    //       body: ListView(
    //         padding: EdgeInsets.only(top: 50),
    //         physics: BouncingScrollPhysics(),
    //         children: snapshot.data.docs.map(
    //           (DocumentSnapshot document) {
    //             return Container(
    //               child: Center(
    //                 child: Text(document['name']),
    //               ),
    //             );
    //           }).toList(),
    //       ),
    //     );
    //   },
    // );
  }
}
