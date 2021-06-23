
import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TasksPage extends StatefulWidget {
  @override
  TasksPageState createState() => TasksPageState();
}

class TasksPageState extends State<TasksPage> {
  TextEditingController _deletecontroller = TextEditingController();
  TextEditingController _startcontroller = TextEditingController();
  TextEditingController _endcontroller = TextEditingController();
  TextEditingController _descriptioncontroller = TextEditingController();
  List<Color> _colorCollection = <Color>[];
  MeetingDataSource events;
  final List<String> options = <String>['Добавить', 'Удалить', 'Обновить'];
  final fireStoreReference = FirebaseFirestore.instance;
  bool isInitialLoaded = false;
  randomIndex() {
    Random random = Random();
    int randomNumber = random.nextInt(100000) + 1;
    _deletecontroller.text = randomNumber.toString();
    return randomNumber.toString();
  }

  @override
  void initState() {
    _initializeEventColor();
    getDataFromFireStore().then((results) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {});
      });
    });
    fireStoreReference.collection("Calendar").snapshots().listen((event) {
      event.docChanges.forEach((element) {
        if (element.type == DocumentChangeType.added) {
          if (!isInitialLoaded) {
            return;
          }

          final Random random = new Random();
          Meeting app = Meeting.fromFireBaseSnapShotData(
              element, _colorCollection[random.nextInt(9)]);
          setState(() {
            events.appointments.add(app);
            events.notifyListeners(CalendarDataSourceAction.add, [app]);
          });
        } else if (element.type == DocumentChangeType.modified) {
          if (!isInitialLoaded) {
            return;
          }

          final Random random = new Random();
          Meeting app = Meeting.fromFireBaseSnapShotData(
              element, _colorCollection[random.nextInt(9)]);
          setState(() {
            int index = events.appointments
                .indexWhere((app) => app.key == element.doc.id);

            Meeting meeting = events.appointments[index];

            events.appointments.remove(meeting);
            events.notifyListeners(CalendarDataSourceAction.remove, [meeting]);
            events.appointments.add(app);
            events.notifyListeners(CalendarDataSourceAction.add, [app]);
          });
        } else if (element.type == DocumentChangeType.removed) {
          if (!isInitialLoaded) {
            return;
          }

          setState(() {
            int index = events.appointments
                .indexWhere((app) => app.key == element.doc.id);

            Meeting meeting = events.appointments[index];
            events.appointments.remove(meeting);
            events.notifyListeners(CalendarDataSourceAction.remove, [meeting]);
          });
        }
      });
    });
    super.initState();
  }

  Future<void> getDataFromFireStore() async {
    var snapShotsValue = await fireStoreReference.collection("Calendar").get();

    final Random random = new Random();
    List<Meeting> list = snapShotsValue.docs
        .map((e) => Meeting(
            eventName: e.data()['Описание'],
            from: DateFormat('dd/MM/yyyy HH:mm:ss')
                .parse(e.data()['Время начала']),
            to: DateFormat('dd/MM/yyyy HH:mm:ss')
                .parse(e.data()['Время окончания']),
            background: _colorCollection[random.nextInt(9)],
            isAllDay: false,
            key: e.id))
        .toList();
    setState(() {
      events = MeetingDataSource(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    isInitialLoaded = true;
    return Scaffold(
      appBar: AppBar(
          leading: PopupMenuButton<String>(
        icon: Icon(Icons.settings),
        itemBuilder: (BuildContext context) => options.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList(),
        onSelected: (String value) {
          if (value == 'Добавить') {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                  child: Container(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Описание'),
                      controller: _descriptioncontroller,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Время начала'),
                      controller: _startcontroller,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Время окончания'),
                      controller: _endcontroller,
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            if (_descriptioncontroller.text.isEmpty ||
                                _startcontroller.text.isEmpty ||
                                _endcontroller.text.isEmpty) {
                              Fluttertoast.showToast(msg: 'Заполните все поля');
                            } else {
                              fireStoreReference
                                  .collection("Calendar")
                                  .doc(randomIndex())
                                  .set({
                                'Описание': _descriptioncontroller.text,
                                'Время начала': _startcontroller.text,
                                'Время конца': _endcontroller.text
                              });
                            }
                            _descriptioncontroller.clear();
                            _startcontroller.clear();
                            _endcontroller.clear();
                            Navigator.pop(context);
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            _descriptioncontroller.clear();
                            _startcontroller.clear();
                            _endcontroller.clear();
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.cancel),
                        )
                      ],
                    )
                  ],
                ),
              )),
            );
          } else if (value == "Удалить") {
            try {
              fireStoreReference
                  .collection('Calendar')
                  .doc(_deletecontroller.text)
                  .delete();
            } catch (e) {}
          }
        },
      )),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: SfCalendar(
              view: CalendarView.month,
              firstDayOfWeek: 1,
              initialDisplayDate: DateTime.now(),
              dataSource: events,
              monthViewSettings: MonthViewSettings(
                showAgenda: true,
              ),
            ),
          ),
          // StreamBuilder(
          //   stream:
          //       FirebaseFirestore.instance.collection('Calendar').snapshots(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (!snapshot.hasData) {
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     return Container(
          //       child: ListView(
          //         children: snapshot.data.docs.map((doucment) {
          //           Text(document['Описание'])
          //         }).toList(),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  void _initializeEventColor() {
    _colorCollection.add(const Color(0xFF0F8644));
    _colorCollection.add(const Color(0xFF8B1FA9));
    _colorCollection.add(const Color(0xFFD20100));
    _colorCollection.add(const Color(0xFFFC571D));
    _colorCollection.add(const Color(0xFF36B37B));
    _colorCollection.add(const Color(0xFF01A1EF));
    _colorCollection.add(const Color(0xFF3D4FB5));
    _colorCollection.add(const Color(0xFFE47C73));
    _colorCollection.add(const Color(0xFF636363));
    _colorCollection.add(const Color(0xFF0A8043));
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }
}

class Meeting {
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  String key;

  Meeting(
      {this.eventName,
      this.from,
      this.to,
      this.background,
      this.isAllDay,
      this.key});

  static Meeting fromFireBaseSnapShotData(dynamic element, Color color) {
    return Meeting(
        eventName: element.doc.data()['Описание'],
        from: DateFormat('dd/MM/yyyy HH:mm:ss')
            .parse(element.doc.data()['Время начала']),
        to: DateFormat('dd/MM/yyyy HH:mm:ss')
            .parse(element.doc.data()['Время окончания']),
        background: Colors.deepOrange,
        isAllDay: false,
        key: element.doc.id);
  }
}
