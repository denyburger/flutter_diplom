import 'package:flutter/material.dart';
import 'package:team_nightingales_app/screens/achievments_screen/conts.dart';

class AchievmentsPage extends StatefulWidget {
  const AchievmentsPage({Key key}) : super(key: key);

  @override
  _AchievmentsPageState createState() => _AchievmentsPageState();
}

class _AchievmentsPageState extends State<AchievmentsPage> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> achievmentData = [];

  void getAchievmentsData() {
    List<dynamic> achevList = Achievments_Data;
    List<Widget> listItems = [];
    achevList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["year"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${post["place"]}",
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Image.asset(
                  "assets/images/${post["image"]}",
                  height: double.infinity,
                )
              ],
            ),
          )));
    });
    setState(() {
      achievmentData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getAchievmentsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: ListView.builder(
        controller: controller,
        itemCount: achievmentData.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Align(
              alignment: Alignment.topCenter,
              heightFactor: 0.7,
              child: achievmentData[index]);
        },
      )),
    );
}
}
