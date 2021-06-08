import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:team_nightingales_app/screens/authorization_screen/authorization.dart';
import 'package:team_nightingales_app/screens/authorization_screen/components/auth.dart';
import 'package:team_nightingales_app/screens/start_screen/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
class Check extends StatelessWidget {
  const Check({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     UserModel userModel = Provider.of<UserModel>(context);
  return userModel !=null ? StartPage() : Authorization();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthClass().streamUser,
          initialData: null,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        home: Check()
      ),
    );
  }
}
